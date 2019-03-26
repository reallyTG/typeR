library(lmomco)


### Name: is.glo
### Title: Is a Distribution Parameter Object Typed as Generalized Logistic
### Aliases: is.glo
### Keywords: utility (distribution, type check) Distribution: Generalized
###   Logistic

### ** Examples

para <- parglo(lmoms(c(123,34,4,654,37,78)))
if(is.glo(para) == TRUE) {
  Q <- quaglo(0.5,para)
}



