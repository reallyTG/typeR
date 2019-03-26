library(lmomco)


### Name: are.partri.valid
### Title: Are the Distribution Parameters Consistent with the Asymmetric
###   Triangular Distribution
### Aliases: are.partri.valid
### Keywords: utility (distribution) Distribution: Asymmetric Triangular
###   Distribution: Triangular utility (distribution, parameter validation)

### ** Examples

para <- partri(lmoms(c(46, 70, 59, 36, 71, 48, 46, 63, 35, 52)))
if(are.partri.valid(para)) Q <- quatri(0.5,para)



