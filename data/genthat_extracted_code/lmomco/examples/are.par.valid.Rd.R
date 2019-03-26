library(lmomco)


### Name: are.par.valid
### Title: Are the Distribution Parameters Consistent with the Distribution
### Aliases: are.par.valid
### Keywords: utility (distribution) utility (distribution, parameter
###   validation) distribution (utility)

### ** Examples

vec  <- c(12,120)           # parameters of exponential distribution
para <- vec2par(vec,'exp')  # build exponential distribution parameter
                            # object
# The following two conditionals are equivalent as are.parexp.valid()
# is called within are.par.valid().
if(are.par.valid(para))    Q <- quaexp(0.5,para)
if(are.parexp.valid(para)) Q <- quaexp(0.5,para)



