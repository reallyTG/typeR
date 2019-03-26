library(MAMS)


### Name: stepdown.update
### Title: Update the stopping boundaries of multi-arm multi-stage study at
###   an interim analysis, allowing for unplanned treatment selection
###   and/or sample-size reassessment.
### Aliases: stepdown.update
### Keywords: design

### ** Examples
## No test: 
# 2-stage 3-treatments versus control design
# all promising treatments are selected:
orig_mams <- stepdown.mams(nMat=matrix(c(10, 20), nrow=2, ncol=4), 
                           alpha.star=c(0.01, 0.05), lb=0, 
                           selection="all.promising")

# make adjustment for the observed sample sizes 
# not being exactly as planned:
stepdown.update(orig_mams, nobs=c(9, 8, 13, 11), zscores=c(1.1, -0.5, 0.2), 
                selected.trts=1:3, nfuture=NULL)

# make adjustment for the observed sample sizes 
# not being exactly as planned. In addition, drop treatment 2:
stepdown.update(orig_mams, nobs=c(9, 8, 13, 11), zscores=c(1.1, -0.5, 0.2), 
                selected.trts=c(1, 3), nfuture=NULL)

# make adjustment for the observed sample sizes not being 
# exactly as planned. In addition, drop treatment 2. In addition, 
# double the planed cumulative second stage sample sizes:
updated_mams1 <- stepdown.update(orig_mams, nobs=c(9, 8, 13, 11), 
                                 zscores=c(1.1, -0.5, 0.2), selected.trts=c(1, 3), 
                                 nfuture=matrix(c(40, 40, 13, 40), nrow=1, ncol=4))

# Account for the observed second stage sample sizes:
stepdown.update(updated_mams1, nobs=c(38, 41, 13, 36), zscores=c(1.9, -Inf, 1.2), 
                selected.trts=NULL)

# 'select.best' design. Account for actually observed sample sizes 
# in first stage, and drop treatment 2:
orig_mams <- stepdown.mams(nMat=matrix(c(10, 20), nrow=2, ncol=4), 
                           alpha.star=c(0.01, 0.05), lb=0, selection="select.best")

stepdown.update(orig_mams, nobs=c(9, 8, 13, 11), zscores=c(1.1, -0.5, 0.2), 
                selected.trts=c(1, 3), nfuture=NULL)
## End(No test)


