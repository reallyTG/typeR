library(textshape)


### Name: split_word
### Title: Split Words
### Aliases: split_word split_word.default split_word.data.frame

### ** Examples

(x <- c(
    "Mr. Brown comes! He says hello. i give him coffee.",
    "I'll go at 5 p. m. eastern time.  Or somewhere in between!",
    "go there"
))
split_word(x)
split_word(x, lower=FALSE)

data(DATA)
split_word(DATA)
split_word(DATA, lower=FALSE)

## Larger data set
split_word(hamlet)



