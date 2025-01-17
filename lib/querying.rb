def select_books_titles_and_years_in_first_series_order_by_year
  #"SELECT books.title, books.year FROM books WHERE books.series_id = 1 ORDER BY books.year;"
  "SELECT title, year FROM books WHERE series_id = 1 ORDER BY year;"
end

def select_name_and_motto_of_char_with_longest_motto
  #"SELECT characters.name, characters.motto FROM characters ORDER BY LENGTH(characters.motto) DESC LIMIT 1;"
  "SELECT name, motto FROM characters ORDER BY LENGTH(motto) DESC LIMIT 1;"
end

def select_value_and_count_of_most_prolific_species
  #"SELECT characters.species, COUNT(characters.species) FROM characters GROUP BY characters.species ORDER BY COUNT(characters.species) DESC LIMIT 1;"
  "SELECT species, COUNT(*) FROM characters GROUP BY species ORDER BY COUNT(species) DESC LIMIT 1;"
end

def select_name_and_series_subgenres_of_authors
  #"SELECT authors.name, subgenres.name FROM series JOIN authors JOIN subgenres ON series.author_id = authors.id AND series.subgenre_id = subgenres.id;"
  <<-SQL
    SELECT authors.name, subgenres.name
    FROM authors
    JOIN series JOIN subgenres
    ON series.author_id = authors.id AND series.subgenre_id = subgenres.id
    SQL
end

def select_series_title_with_most_human_characters
  #"SELECT series.title FROM series JOIN authors JOIN characters ON series.author_id = authors.id AND authors.id = characters.author_id GROUP BY characters.species ORDER BY COUNT(characters.species) DESC LIMIT 1;"
  <<-SQL
    SELECT series.title
    FROM series
    JOIN books JOIN characters JOIN character_books
    ON books.series_id = series.id AND books.id = character_books.book_id AND characters.id = character_books.character_id
    WHERE characters.species = 'human'
    GROUP BY series.title
    ORDER BY COUNT(*) desc
    LIMIT 1
    SQL
end

def select_character_names_and_number_of_books_they_are_in
  "SELECT characters.name, COUNT(character_books.book_id) FROM characters JOIN character_books ON characters.id = character_books.character_id GROUP BY characters.name ORDER BY COUNT(character_books.book_id) DESC;" 
end
