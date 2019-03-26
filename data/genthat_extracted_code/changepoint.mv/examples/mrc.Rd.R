library(changepoint.mv)


### Name: mrc
### Title: Most Recent Changepoints.
### Aliases: mrc

### ** Examples

library(changepoint.mv)
data(mrcexample)
res<-mrc(mrcexample,pmax=2)
MDL(res)     # MDL == pmax (possibly under-estimating MDL, retry)
res<-mrc(mrcexample,pmax=6)
MDL(res)     # MDL = 5 (< pmax)
# view the most recent changepoints (corresponding to pmax = 5)
unique(cpts.mr(res,p=5)[,1])
summary(res) # summary of result




