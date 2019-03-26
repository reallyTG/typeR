library(qmrparser)


### Name: numberScientific
### Title: Number in scientific notation token.
### Aliases: numberScientific
### Keywords: token

### ** Examples


# fail
stream  <- streamParserFromString("Hello world")
( numberScientific()(stream) )[c("status","node")]

# ok 
stream  <- streamParserFromString("-1234e12")
( numberScientific()(stream) )[c("status","node")]




