library(lmomco)


### Name: is.aep4
### Title: Is a Distribution Parameter Object Typed as 4-Parameter
###   Asymmetric Exponential Power
### Aliases: is.aep4
### Keywords: utility (distribution, type check) Distribution: Asymmetric
###   Exponential Power

### ** Examples

para <- vec2par(c(0,1, 0.5, 4), type="aep4")
if(is.aep4(para) == TRUE) {
  Q <- quaaep4(0.55,para)
}



