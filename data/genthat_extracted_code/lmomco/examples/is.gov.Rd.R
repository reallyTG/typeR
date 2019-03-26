library(lmomco)


### Name: is.gov
### Title: Is a Distribution Parameter Object Typed as Govindarajulu
### Aliases: is.gov
### Keywords: utility (distribution, type check) Distribution:
###   Govindarajulu

### ** Examples

para <- pargov(lmoms(c(123,34,4,654,37,78)))
if(is.gov(para) == TRUE) {
  Q <- quagov(0.5,para)
}



