library(qmrparser)


### Name: commentParser
### Title: Comment token.
### Aliases: commentParser
### Keywords: token

### ** Examples


# fail
stream  <- streamParserFromString("123")
( commentParser("(*","*)")(stream) )[c("status","node")]

# ok 
stream  <- streamParserFromString("(*123*)")
( commentParser("(*","*)")(stream) )[c("status","node")]




