library(qmrparser)


### Name: eofMark
### Title: End of file token
### Aliases: eofMark
### Keywords: token

### ** Examples


# fail
stream  <- streamParserFromString("Hello world")
( eofMark()(stream) )[c("status","node")]

# ok 
stream  <- streamParserFromString("")
( eofMark()(stream) )[c("status","node")]




