library(pop)


### Name: transfun
### Title: transfun objects
### Aliases: *.transfun is.transfun parameters.transfun
###   parameters<-.transfun print.transfun transfun

### ** Examples

prob <- p(0.3)
is.transfun(prob)

prob
(compound <- prob * r(4.3))

# extract the transfun parameters
(param_prob <- parameters(prob))
(param_compound <- parameters(compound))

# update the parameters of these transfuns
param_prob$p <- 0.6
parameters(prob) <- param_prob
parameters(prob)

param_compound$r <- 15
parameters(compound) <- param_compound
parameters(compound)



