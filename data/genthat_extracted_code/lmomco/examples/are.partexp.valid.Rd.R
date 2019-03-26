library(lmomco)


### Name: are.partexp.valid
### Title: Are the Distribution Parameters Consistent with the Truncated
###   Exponential Distribution
### Aliases: are.partexp.valid
### Keywords: utility (distribution) Distribution: Exponential (trimmed)
###   utility (distribution, parameter validation)

### ** Examples

para <- partexp(lmoms(c(90,134,100,114,177,378)))
if(are.partexp.valid(para)) Q <- quatexp(0.5,para)



