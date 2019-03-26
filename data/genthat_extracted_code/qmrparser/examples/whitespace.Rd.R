library(qmrparser)


### Name: whitespace
### Title: White sequence token.
### Aliases: whitespace
### Keywords: token

### ** Examples


# ok
stream  <- streamParserFromString("Hello world")
( whitespace()(stream) )[c("status","node")]

# ok
stream  <- streamParserFromString(" Hello world")
( whitespace()(stream) )[c("status","node")]

# ok 
stream  <- streamParserFromString("")
(  whitespace()(stream) )[c("status","node")]




