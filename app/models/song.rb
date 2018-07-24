class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end

  def artist_name
    self.artist ? self.artist.name : nil
  end

  def genre_name=(name)
    self.genre = Genre.find_by(name: name)
  end

  def genre_name
    self.genre ? self.genre.name : nil
  end

  def note_contents=(notes)
    notes.each do |note|
      if !note.empty?
        self.notes << Note.create(content: note)
      end
    end
  end

  def note_contents
    self.notes.map do |note|
      note.content
    end
  end

  # def notes_1=(note)
  #   self.note_contents = note
  # end
  #
  # def notes_1
  # end
  #
  # def notes_2=(note)
  #   self.note_contents = note
  # end
  #
  # def notes_2
  # end
  #
  # def notes_3=(note)
  #   self.note_contents = note
  # end
  #
  # def notes_3
  # end

end
