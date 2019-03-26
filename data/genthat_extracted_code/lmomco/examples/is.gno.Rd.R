library(lmomco)


### Name: is.gno
### Title: Is a Distribution Parameter Object Typed as Generalized Normal
### Aliases: is.gno
### Keywords: utility (distribution, type check) Distribution: Generalized
###   Normal

### ** Examples

para <- pargno(lmoms(c(123,34,4,654,37,78)))
if(is.gno(para) == TRUE) {
  Q <- quagno(0.5,para)
}



