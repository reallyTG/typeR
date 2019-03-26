library(ODEsensitivity)


### Name: ODEsobol.ODEnetwork
### Title: Sobol' Sensitivity Analysis for Objects of Class 'ODEnetwork'
### Aliases: ODEsobol.ODEnetwork

### ** Examples

##### A network of 4 mechanical oscillators connected in a circle #####
# Definition of the network using the package "ODEnetwork":
M_mat <- rep(2, 4)
K_mat <- diag(rep(2 * (2*pi*0.17)^2, 4))
K_mat[1, 2] <- K_mat[2, 3] <- 
  K_mat[3, 4] <- K_mat[1, 4] <- 2 * (2*pi*0.17)^2 / 10
D_mat <- diag(rep(0.05, 4))
library("ODEnetwork")
lfonet <- ODEnetwork(masses = M_mat, dampers = D_mat, springs = K_mat)
# The parameters to be included in the sensitivity analysis and their lower
# and upper boundaries:
LFOpars <- c("k.1", "k.2", "k.3", "k.4",
             "d.1", "d.2", "d.3", "d.4")
LFObinf <- c(rep(0.2, 4), rep(0.01, 4))
LFObsup <- c(rep(20, 4), rep(0.1, 4))
# Setting of the initial values of the state variables:
lfonet <- setState(lfonet, state1 = rep(2, 4), state2 = rep(0, 4))
# The timepoints of interest:
LFOtimes <- seq(25, 150, by = 2.5)
# Sobol' sensitivity analysis (here only with n = 500, but n = 1000 is
# recommended):
set.seed(1739)
# Warning: The following code might take very long! There are warnings
# occurring which might be due to "n" being too low.
## No test: 
suppressWarnings(
  LFOres_sobol <- ODEsobol(mod = lfonet,
                           pars = LFOpars,
                           times = LFOtimes,
                           n = 500,
                           rfuncs = "runif",
                           rargs = paste0("min = ", LFObinf,
                                          ", max = ", LFObsup),
                           sobol_method = "Martinez",
                           parallel_eval = TRUE,
                           parallel_eval_ncores = 2)
)
## End(No test)




