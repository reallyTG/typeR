library(lmomco)


### Name: are.parkmu.valid
### Title: Are the Distribution Parameters Consistent with the Kappa-Mu
###   Distribution
### Aliases: are.parkmu.valid
### Keywords: utility (distribution) Distribution: Kappa-Mu utility
###   (distribution, parameter validation)

### ** Examples

para <- vec2par(c(0.5, 1.5), type="kmu")
if(are.parkmu.valid(para)) Q <- quakmu(0.5,para)



