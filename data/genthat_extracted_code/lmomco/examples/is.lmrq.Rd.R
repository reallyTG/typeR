library(lmomco)


### Name: is.lmrq
### Title: Is a Distribution Parameter Object Typed as Linear Mean Residual
###   Quantile Function
### Aliases: is.lmrq
### Keywords: utility (distribution, type check) Distribution: Linear Mean
###   Residual Quantile Function

### ** Examples

para <- parlmrq(lmoms(c(3, 0.05, 1.6, 1.37, 0.57, 0.36, 2.2)))
if(is.lmrq(para) == TRUE) {
  Q <- qualmrq(0.5,para)
}



