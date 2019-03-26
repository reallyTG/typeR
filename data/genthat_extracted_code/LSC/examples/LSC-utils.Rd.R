library(LSC)


### Name: LSC-utils
### Title: Utilities for LSC class
### Aliases: LSC-utils plot.LSC plot_LSC_0plus1D plot_LSC_1plus1D
###   plot_LSC_2plus1D
### Keywords: hplot

### ** Examples

## Not run: 
##D data(contCA00)
##D 
##D temp_lsc <- states2LSC(states = contCA00$predictive_states - 
##D     min(contCA00$predictive_states) + 1)
##D class(temp_lsc) <- c("LSC", "LSC_1plus1D")
##D plot_LSC_1plus1D(temp_lsc)
## End(Not run)
## Not run: 
##D data(contCA00)
##D 
##D temp_lsc <- states2LSC(states = contCA00$predictive_states - 
##D     min(contCA00$predictive_states) + 1)
##D temp_lsc_3D <- array(temp_lsc, dim = c(25, 20, 40))
##D class(temp_lsc_3D) <- c("LSC", "LSC_2plus1D")
##D plot_LSC_2plus1D(temp_lsc_3D, type = "temporal")
##D plot_LSC_2plus1D(temp_lsc_3D, type = "spatial")
## End(Not run)
state.sim <- rpois(100, 1)

lsc.est <- states2LSC(states = state.sim)
class(lsc.est) <- c("LSC", "LSC_0plus1D")
plot_LSC_0plus1D(lsc.est)

weights.sim <- matrix(runif(1000, 0, 1), ncol = 10)
weights.sim <- normalize(weights.sim)
lsc.est <- states2LSC(weight.matrix = weights.sim)
plot_LSC_0plus1D(lsc.est)



