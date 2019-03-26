library(MAMS)


### Name: stepdown.mams
### Title: Function to find stopping boundaries for a 2- or 3-stage
###   (step-down) multiple-comparisons-with-control test.
### Aliases: stepdown.mams
### Keywords: design

### ** Examples
## No test: 
# Note that some of these examples may take a few minutes to run

# 2-stage 3-treatments versus control design, all promising treatments are selected:
stepdown.mams(nMat=matrix(c(10, 20), nrow=2, ncol=4), 
              alpha.star=c(0.01, 0.05), lb=0, 
              selection="all.promising")

# select the best treatment after the first stage:
stepdown.mams(nMat=matrix(c(10, 20), nrow=2, ncol=4), 
              alpha.star=c(0.01, 0.05), lb=0, 
              selection="select.best")

# 3 stages and unequal randomization:
stepdown.mams(nMat=matrix(c(20, 40, 60, rep(c(10, 20, 30), 3)), nrow=3, ncol=4), 
              alpha.star=c(0.01, 0.025, 0.05), lb=c(0, 0.75), 
              selection="all.promising")
## End(No test)


