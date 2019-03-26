library(qmrparser)


### Name: numberInteger
### Title: Integer number token.
### Aliases: numberInteger
### Keywords: token

### ** Examples


# fail
stream  <- streamParserFromString("Hello world")
( numberInteger()(stream) )[c("status","node")]

# ok 
stream  <- streamParserFromString("-1234")
( numberInteger()(stream) )[c("status","node")]




