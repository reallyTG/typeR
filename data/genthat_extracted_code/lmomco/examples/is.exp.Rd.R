library(lmomco)


### Name: is.exp
### Title: Is a Distribution Parameter Object Typed as Exponential
### Aliases: is.exp
### Keywords: utility (distribution, type check) Distribution: Exponential

### ** Examples

para <- parexp(lmoms(c(123,34,4,654,37,78)))
if(is.exp(para) == TRUE) {
  Q <- quaexp(0.5,para)
}



