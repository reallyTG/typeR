library(lmomco)


### Name: are.paraep4.valid
### Title: Are the Distribution Parameters Consistent with the 4-Parameter
###   Asymmetric Exponential Power Distribution
### Aliases: are.paraep4.valid
### Keywords: utility (distribution) Distribution: Asymmetric Exponential
###   Power utility (distribution, parameter validation)

### ** Examples

para <- vec2par(c(0,1, 0.5, 4), type="aep4")
if(are.paraep4.valid(para)) Q <- quaaep4(0.5,para)



