library(qmrparser)


### Name: empty
### Title: Empty token
### Aliases: empty
### Keywords: token

### ** Examples


# ok
stream  <- streamParserFromString("Hello world")
( empty()(stream) )[c("status","node")]

# ok 
stream  <- streamParserFromString("")
( empty()(stream) )[c("status","node")]




