library(lmomco)


### Name: are.parcau.valid
### Title: Are the Distribution Parameters Consistent with the Cauchy
###   Distribution
### Aliases: are.parcau.valid
### Keywords: utility (distribution) Distribution: Cauchy utility
###   (distribution, parameter validation)

### ** Examples

para <- vec2par(c(12,12),type='cau')
if(are.parcau.valid(para)) Q <- quacau(0.5,para)



