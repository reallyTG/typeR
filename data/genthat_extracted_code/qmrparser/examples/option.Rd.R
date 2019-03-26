library(qmrparser)


### Name: option
### Title: Optional parser
### Aliases: option
### Keywords: parser combinator

### ** Examples


# ok
stream  <- streamParserFromString("123 Hello world")
( option(numberNatural())(stream) )[c("status","node")]


# ok
stream  <- streamParserFromString("123 Hello world")
( option(string())(stream) )[c("status","node")]




