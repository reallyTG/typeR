library(lmomco)


### Name: is.wei
### Title: Is a Distribution Parameter Object Typed as Weibull
### Aliases: is.wei
### Keywords: utility (distribution, type check) Distribution: Weibull

### ** Examples

para <- parwei(lmoms(c(123,34,4,654,37,78)))
if(is.wei(para) == TRUE) {
  Q <- quawei(0.5,para)
}



