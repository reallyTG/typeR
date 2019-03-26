library(qmrparser)


### Name: string
### Title: Token string
### Aliases: string
### Keywords: token

### ** Examples


# fail
stream  <- streamParserFromString("Hello world")
( string()(stream) )[c("status","node")]

# ok 
stream  <- streamParserFromString("'Hello world'")
( string()(stream) )[c("status","node")]




