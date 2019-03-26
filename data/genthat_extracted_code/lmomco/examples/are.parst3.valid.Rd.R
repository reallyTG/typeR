library(lmomco)


### Name: are.parst3.valid
### Title: Are the Distribution Parameters Consistent with the 3-Parameter
###   Student t Distribution
### Aliases: are.parst3.valid
### Keywords: utility (distribution) Distribution: Student t (3-parameter)
###   utility (distribution, parameter validation)

### ** Examples

para <- parst3(lmoms(c(90,134,100,114,177,378)))
if(are.parst3.valid(para)) Q <- quast3(0.5,para)



