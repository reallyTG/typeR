library(stringr)


### Name: str_starts
### Title: Detect the presence or absence of a pattern at the beginning or
###   end of a string.
### Aliases: str_starts str_ends

### ** Examples

fruit <- c("apple", "banana", "pear", "pinapple")
str_starts(fruit, "p")
str_starts(fruit, "p", negate = TRUE)
str_ends(fruit, "e")
str_ends(fruit, "e", negate = TRUE)



