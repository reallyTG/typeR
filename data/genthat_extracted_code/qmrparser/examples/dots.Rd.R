library(qmrparser)


### Name: dots
### Title: Dots sequence token.
### Aliases: dots
### Keywords: token

### ** Examples


# fail
stream  <- streamParserFromString("Hello world")
( dots()(stream) )[c("status","node")]

# ok 
stream  <- streamParserFromString("..")
( dots()(stream) )[c("status","node")]




