library(lmomco)


### Name: are.parsla.valid
### Title: Are the Distribution Parameters Consistent with the Slash
###   Distribution
### Aliases: are.parsla.valid
### Keywords: utility (distribution) Distribution: Slash utility
###   (distribution, parameter validation)

### ** Examples

para <- vec2par(c(12,1.2),type='sla')
if(are.parsla.valid(para)) Q <- quasla(0.5,para)



