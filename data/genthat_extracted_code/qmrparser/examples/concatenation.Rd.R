library(qmrparser)


### Name: concatenation
### Title: One phrase then another
### Aliases: concatenation
### Keywords: parser combinator

### ** Examples


# ok
stream  <- streamParserFromString("123Hello world")
( concatenation(numberNatural(),symbolic())(stream) )[c("status","node")]


# fail
stream  <- streamParserFromString("123 Hello world")
( concatenation(string(),symbolic())(stream) )[c("status","node")]




