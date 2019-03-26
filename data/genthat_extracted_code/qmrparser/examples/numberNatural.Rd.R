library(qmrparser)


### Name: numberNatural
### Title: Natural number token.
### Aliases: numberNatural
### Keywords: token

### ** Examples


# fail
stream  <- streamParserFromString("Hello world")
( numberNatural()(stream) )[c("status","node")]

# ok 
stream  <- streamParserFromString("123")
( numberNatural()(stream) )[c("status","node")]




