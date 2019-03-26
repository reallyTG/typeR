library(qmrparser)


### Name: symbolic
### Title: Alphanumeric token.
### Aliases: symbolic
### Keywords: token

### ** Examples


# fail
stream  <- streamParserFromString("123")
( symbolic()(stream) )[c("status","node")]

# ok 
stream  <- streamParserFromString("abc123_2")
( symbolic()(stream) )[c("status","node")]




