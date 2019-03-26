library(chinese.misc)


### Name: is_character_vector
### Title: A Convenient Version of is.character
### Aliases: is_character_vector

### ** Examples

is_character_vector(character(0))
is_character_vector(NA)
is_character_vector(as.character(NA))
is_character_vector(c(NA, NA))
is_character_vector(as.character(c(NA,NA)))
is_character_vector(as.character(c(NA, NA)), allow_all_na = FALSE)
is_character_vector(as.character(c(NA, NA)), allow_all_na = TRUE)
is_character_vector(matrix(c("a", "b", "c", "d"), nr = 2))
is_character_vector(c("a", "b", "c"), len = c(1, 10))
is_character_vector(c("a", "b", "c"), len = c(1:10))



