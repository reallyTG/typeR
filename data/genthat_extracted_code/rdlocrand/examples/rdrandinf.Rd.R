library(rdlocrand)


### Name: rdrandinf
### Title: Randomization Inference for RD Designs under Local Randomization
### Aliases: rdrandinf

### ** Examples

# Toy dataset
X <- array(rnorm(200),dim=c(100,2))
R <- X[1,] + X[2,] + rnorm(100)
Y <- 1 + R -.5*R^2 + .3*R^3 + (R>=0) + rnorm(100)
# Randomization inference in window (-.75,.75)
tmp <- rdrandinf(Y,R,wl=-.75,wr=.75)
# Randomization inference in window (-.75,.75), all statistics
tmp <- rdrandinf(Y,R,wl=-.75,wr=.75,statistic='all')
# Randomization inference with window selection
# Note: low number of replications to speed up process.
# The user should increase the number of replications.
tmp <- rdrandinf(Y,R,statistic='all',covariates=X,wmin=.5,wstep=.125,rdwreps=500)






