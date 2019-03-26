library(labelled)


### Name: to_character
### Title: Convert input to a character vector
### Aliases: to_character to_character.labelled

### ** Examples

v <- labelled(c(1,2,2,2,3,9,1,3,2,NA), c(yes = 1, no = 3, "don't know" = 9))
to_character(v)
to_character(v, missing_to_na = FALSE, nolabel_to_na = TRUE)
to_character(v, "v")
to_character(v, "p")



