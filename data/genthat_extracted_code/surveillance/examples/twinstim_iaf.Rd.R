library(surveillance)


### Name: twinstim_iaf
### Title: Temporal and Spatial Interaction Functions for 'twinstim'
### Aliases: siaf.constant siaf.step siaf.gaussian siaf.powerlaw
###   siaf.powerlawL siaf.student tiaf.constant tiaf.step tiaf.exponential
### Keywords: models utilities

### ** Examples

# constant temporal dispersal
tiaf.constant()
# step function kernel
tiaf.step(c(3,7), maxRange=14, nTypes=2)
# exponential decay specification
tiaf.exponential()

# Type-dependent Gaussian spatial interaction function using an adaptive
# two-dimensional midpoint-rule to integrate it over polygonal domains
siaf.gaussian(2, F.adaptive=TRUE)

# Single-type Gaussian spatial interaction function (using polyCub.iso)
siaf.gaussian()

# Type-independent power-law kernel
siaf.powerlaw()

# "lagged" power-law
siaf.powerlawL()

# (reparametrized) t-kernel
siaf.student()

# step function kernel
siaf.step(c(10,20,50), maxRange=100)



