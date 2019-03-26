library(qmrparser)


### Name: separator
### Title: Generic word separator token.
### Aliases: separator
### Keywords: token

### ** Examples


# ok
stream  <- streamParserFromString("; Hello world")
( separator()(stream) )[c("status","node")]

# ok 
stream  <- streamParserFromString(" ")
( separator()(stream) )[c("status","node")]


# fail
stream  <- streamParserFromString("Hello world")
( separator()(stream) )[c("status","node")]

# fail 
stream  <- streamParserFromString("")
( separator()(stream) )[c("status","node")]




