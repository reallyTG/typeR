library(qmrparser)


### Name: repetition0N
### Title: Repeats one parser
### Aliases: repetition0N
### Keywords: parser combinator

### ** Examples


# ok
stream  <- streamParserFromString("Hello world")
( repetition0N(symbolic())(stream) )[c("status","node")]


# ok
stream  <- streamParserFromString("123 Hello world")
( repetition0N(symbolic())(stream) )[c("status","node")]




