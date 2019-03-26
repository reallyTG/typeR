library(qmrparser)


### Name: charParser
### Title: Specific single character token.
### Aliases: charParser
### Keywords: token

### ** Examples


# fail
stream  <- streamParserFromString("H")
( charParser("a")(stream) )[c("status","node")]

# ok 
stream  <- streamParserFromString("a")
( charParser("a")(stream) )[c("status","node")]

# ok 
( charParser("\U00B6")(streamParserFromString("\U00B6")) )[c("status","node")]




