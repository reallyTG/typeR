library(sirt)


### Name: sim.raschtype
### Title: Simulate from Generalized Logistic Item Response Model
### Aliases: sim.raschtype
### Keywords: Simulating IRT models

### ** Examples

#############################################################################
## EXAMPLE 1: Simulation of data from a Rasch model (alpha_1=alpha_2=0)
#############################################################################

set.seed(9765)
N <- 500    # number of persons
I <- 11     # number of items
b <- seq( -2, 2, length=I )
dat <- sirt::sim.raschtype( stats::rnorm( N ), b )
colnames(dat) <- paste0( "I", 1:I )



