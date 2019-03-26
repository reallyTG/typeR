library(rdlocrand)


### Name: rdsensitivity
### Title: Sensitivity analysis for RD designs under local randomization
### Aliases: rdsensitivity

### ** Examples

# Toy dataset
R <- runif(100,-1,1)
Y <- 1 + R -.5*R^2 + .3*R^3 + (R>=0) + rnorm(100)
# Sensitivity analysis
# Note: low number of replications to speed up process.
# The user should increase the number of replications.
tmp <- rdsensitivity(Y,R,wlist=seq(.75,2,by=.25),tlist=seq(0,5,by=1),reps=500)





