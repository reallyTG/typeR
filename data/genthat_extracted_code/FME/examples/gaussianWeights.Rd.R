library(FME)


### Name: gaussianWeights
### Title: A kernel average smoother function to weigh residuals according
###   to a Gaussian density function This function is still experimental...
###   use with care
### Aliases: gaussianWeights
### Keywords: utilities

### ** Examples

## =======================================================================
## A Sediment example
## =======================================================================

## Sediment oxygen concentration is measured every
## centimeter in 3 sediment types
depth <- 0:7
observations <- data.frame(
                    profile = rep(c("mud","silt","sand"), each=8),
                    depth   = depth,
                    O2      = c(c(6,1,0.5,0.1,0.05,0,0,0),
                                c(6,5,3,2,1.5,1,0.5,0),
                                c(6,6,5,4,3,2,1,0)
                              )
                )

## A model generates profiles with a depth resolution of 1 millimeter
modeldepths <- seq(0, 9, by = 0.05)

## All these model outputs are compared with  weighed observations.
gaussianWeights(obs = observations, x = depth, y = O2,
                xmodel = modeldepths,
                spread = 0.1, weight = "none", 
                aggregation = profile)



# Weights of one observation in silt at depth 2:
Sub <- subset(observations, subset = (profile == "silt" & depth == 2))
plot(Sub[,-1])
SubWW <- gaussianWeights(obs = Sub, x = depth, y = O2, 
                xmodel = modeldepths, spread = 0.5, 
                weight="none", aggregation = profile)
SubWW[,-1]



