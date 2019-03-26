library(qmrparser)


### Name: charInSetParser
### Title: Single character, belonging to a given set, token
### Aliases: charInSetParser
### Keywords: token

### ** Examples


# fail
stream  <- streamParserFromString("H")
( charInSetParser(isDigit)(stream) )[c("status","node")]

# ok 
stream  <- streamParserFromString("a")
( charInSetParser(isLetter)(stream) )[c("status","node")]





