library(tokenizers)


### Name: tokenize_character_shingles
### Title: Character shingle tokenizers
### Aliases: tokenize_character_shingles

### ** Examples

x <- c("Now is the hour of our discontent")
tokenize_character_shingles(x)
tokenize_character_shingles(x, n = 5)
tokenize_character_shingles(x, n = 5, strip_non_alphanum = FALSE)
tokenize_character_shingles(x, n = 5, n_min = 3, strip_non_alphanum = FALSE)




