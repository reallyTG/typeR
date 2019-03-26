library(crossword.r)


### Name: Crossword
### Title: Crossword
### Aliases: Crossword
### Keywords: datasets

### ** Examples


library(crossword.r)
cw <- Crossword$new(rows = 4, columns = 4)
cw$add_words(c("back", "nasa", "kick", "nuk", "ic", "sic"))
cw
cw$letters
cw$words
cw$density()




