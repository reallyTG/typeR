library(lmomco)


### Name: are.parrevgum.valid
### Title: Are the Distribution Parameters Consistent with the Reverse
###   Gumbel Distribution
### Aliases: are.parrevgum.valid
### Keywords: utility (distribution) Distribution: Gumbel (reversed)
###   utility (distribution, parameter validation)

### ** Examples

para <- vec2par(c(.9252, .1636, .7),type='revgum')
if(are.parrevgum.valid(para)) Q <- quarevgum(0.5,para)



