class Genre < ActiveRecord::Base
  has_many :songs
  has_many :artists, through: :songs

  def song_count
    # return the number of songs in a genre
    self.songs.count
  end

  def artist_count
    # return the number of artists associated with the genre
    Song.select{|song| song.genre_id == self.id}.map(&:artist).uniq.count
  end

  def all_artist_names
    # return an array of strings containing every musician's name
    Song.select{|song| song.genre_id == self.id}.map(&:artist).map(&:name).uniq
  end
end
