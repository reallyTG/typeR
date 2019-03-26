library(rdlocrand)


### Name: rdrbounds
### Title: Rosenbaum bounds for RD designs under local randomization
### Aliases: rdrbounds

### ** Examples

# Toy dataset
R <- runif(100,-1,1)
Y <- 1 + R -.5*R^2 + .3*R^3 + (R>=0) + rnorm(100)
# Rosenbaum bounds
# Note: low number of replications and windows to speed up process.
# The user should increase these values.
rdrbounds(Y,R,expgamma=c(1.5,2),wlist=c(.3),reps=100)





