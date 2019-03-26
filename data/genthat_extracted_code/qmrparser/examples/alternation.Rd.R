library(qmrparser)


### Name: alternation
### Title: Alternative phrases
### Aliases: alternation
### Keywords: parser combinator

### ** Examples



# ok
stream  <- streamParserFromString("123 Hello world")
( alternation(numberNatural(),symbolic())(stream) )[c("status","node")]


# fail
stream  <- streamParserFromString("123 Hello world")
( alternation(string(),symbolic())(stream) )[c("status","node")]





