library(lmomco)


### Name: is.gum
### Title: Is a Distribution Parameter Object Typed as Gumbel
### Aliases: is.gum
### Keywords: utility (distribution, type check) Distribution: Gumbel

### ** Examples

para <- pargum(lmoms(c(123,34,4,654,37,78)))
if(is.gum(para) == TRUE) {
  Q <- quagum(0.5,para)
}



