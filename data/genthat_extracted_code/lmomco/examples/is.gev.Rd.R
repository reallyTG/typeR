library(lmomco)


### Name: is.gev
### Title: Is a Distribution Parameter Object Typed as Generalized Extreme
###   Value
### Aliases: is.gev
### Keywords: utility (distribution, type check) Distribution: Generalized
###   Extreme Value

### ** Examples

para <- pargev(lmoms(c(123,34,4,654,37,78)))
if(is.gev(para) == TRUE) {
  Q <- quagev(0.5,para)
}



