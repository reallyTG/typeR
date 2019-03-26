library(lmomco)


### Name: are.parkur.valid
### Title: Are the Distribution Parameters Consistent with the Kumaraswamy
###   Distribution
### Aliases: are.parkur.valid
### Keywords: utility (distribution) Distribution: Kumaraswamy utility
###   (distribution, parameter validation)

### ** Examples

para <- parkur(lmoms(c(0.25, 0.4, 0.6, 0.65, 0.67, 0.9)))
if(are.parkur.valid(para)) Q <- quakur(0.5,para)



