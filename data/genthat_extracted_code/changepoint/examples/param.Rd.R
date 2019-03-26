library(changepoint)


### Name: param
### Title: Generic Function - param
### Aliases: param
### Keywords: methods cpt internal

### ** Examples

set.seed(1)
x=c(rnorm(100,0,1),rnorm(100,0,10))
ans=cpt.var(x,penalty="Asymptotic",pen.value=0.01,method="AMOC",param.estimates=FALSE)
# if estimates were not requested in the analysis then they can be created at a later stage if
#required
ans=param(ans) # fills the param.est slot with the parameter estimes.
param.est(ans) # variance is 0.8067621



