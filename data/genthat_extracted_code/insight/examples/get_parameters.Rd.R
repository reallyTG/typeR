library(insight)


### Name: get_parameters
### Title: Get model parameters
### Aliases: get_parameters get_parameters.zeroinfl get_parameters.hurdle
###   get_parameters.coxme get_parameters.merMod get_parameters.lme
###   get_parameters.MixMod get_parameters.glmmTMB get_parameters.brmsfit
###   get_parameters.stanreg get_parameters.stanmvreg

### ** Examples

data(mtcars)
m <- lm(mpg ~ wt + cyl + vs, data = mtcars)
get_parameters(m)



