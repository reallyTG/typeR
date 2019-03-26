library(textshape)


### Name: split_token
### Title: Split Tokens
### Aliases: split_token split_token.default split_token.data.frame

### ** Examples

(x <- c(
    "Mr. Brown comes! He says hello. i give him coffee.",
    "I'll go at 5 p. m. eastern time.  Or somewhere in between!",
    "go there"
))
split_token(x)
split_token(x, lower=FALSE)

data(DATA)
split_token(DATA)
split_token(DATA, lower=FALSE)

## Larger data set
split_token(hamlet)



