library(qmrparser)


### Name: repetition1N
### Title: Repeats a parser, at least once.
### Aliases: repetition1N
### Keywords: parser combinator

### ** Examples


# ok
stream  <- streamParserFromString("Hello world")
( repetition1N(symbolic())(stream) )[c("status","node")]


# fail
stream  <- streamParserFromString("123 Hello world")
( repetition1N(symbolic())(stream) )[c("status","node")]




