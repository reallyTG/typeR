library(rdlocrand)


### Name: rdwinselect
### Title: Window selection for RD designs under local randomization
### Aliases: rdwinselect

### ** Examples

# Toy dataset
X <- array(rnorm(200),dim=c(100,2))
R <- X[1,] + X[2,] + rnorm(100)
# Window selection adding 5 observations at each step
# Note: low number of replications to speed up process.
tmp <- rdwinselect(R,X,obsmin=10,wobs=5,reps=500)
# Window selection setting initial window and step
# The user should increase the number of replications.
tmp <- rdwinselect(R,X,wmin=.5,wstep=.125,reps=500)
# Window selection with approximate (large sample) inference and p-value plot
tmp <- rdwinselect(R,X,wmin=.5,wstep=.125,approx=TRUE,nwin=80,quietly=TRUE,plot=TRUE)





