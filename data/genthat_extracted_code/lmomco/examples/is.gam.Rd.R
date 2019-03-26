library(lmomco)


### Name: is.gam
### Title: Is a Distribution Parameter Object Typed as Gamma
### Aliases: is.gam
### Keywords: utility (distribution, type check) Distribution: Gamma

### ** Examples

para <- pargam(lmoms(c(123,34,4,654,37,78)))
if(is.gam(para) == TRUE) {
  Q <- quagam(0.5,para)
}



