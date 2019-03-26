library(qmrparser)


### Name: keyword
### Title: Arbitrary given token.
### Aliases: keyword
### Keywords: token

### ** Examples


# fail
stream  <- streamParserFromString("Hello world")
( keyword("world")(stream) )[c("status","node")]

# ok 
stream  <- streamParserFromString("world")
( keyword("world")(stream) )[c("status","node")]




