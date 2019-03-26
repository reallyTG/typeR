library(stringr)


### Name: case
### Title: Convert case of a string.
### Aliases: case str_to_upper str_to_lower str_to_title str_to_sentence

### ** Examples

dog <- "The quick brown dog"
str_to_upper(dog)
str_to_lower(dog)
str_to_title(dog)
str_to_sentence("the quick brown dog")

# Locale matters!
str_to_upper("i") # English
str_to_upper("i", "tr") # Turkish



