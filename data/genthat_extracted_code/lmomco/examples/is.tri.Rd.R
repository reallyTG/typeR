library(lmomco)


### Name: is.tri
### Title: Is a Distribution Parameter Object Typed as Asymmetric
###   Triangular
### Aliases: is.tri
### Keywords: utility (distribution, type check) Distribution: Asymmetric
###   Triangular Distribution: Triangular

### ** Examples

para <- partri(lmoms(c(46, 70, 59, 36, 71, 48, 46, 63, 35, 52)))
if(is.tri(para) == TRUE) {
  Q <- quatri(0.5,para)
}



