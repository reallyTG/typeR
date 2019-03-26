library(qmrparser)


### Name: numberFloat
### Title: Floating-point number token.
### Aliases: numberFloat
### Keywords: token

### ** Examples


# fail
stream  <- streamParserFromString("Hello world")
( numberFloat()(stream) )[c("status","node")]

# ok 
stream  <- streamParserFromString("-456.74")
( numberFloat()(stream) )[c("status","node")]




