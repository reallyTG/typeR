library(lmomco)


### Name: is.kap
### Title: Is a Distribution Parameter Object Typed as Kappa
### Aliases: is.kap
### Keywords: utility (distribution, type check) Distribution: Kappa

### ** Examples

para <- parkap(lmoms(c(123,34,4,654,37,78)))
if(is.kap(para) == TRUE) {
  Q <- quakap(0.5,para)
}



