library(RRTCS)


### Name: Christofides
### Title: Christofides model
### Aliases: Christofides
### Keywords: Christofides Confidence_interval Estimation Qualitative
###   Randomized_response Transformed_variable Variance

### ** Examples

N=802
data(ChristofidesData)
dat=with(ChristofidesData,data.frame(z,Pi))
mm=c(1,2,3,4,5)
pm=c(0.1,0.2,0.3,0.2,0.2)
cl=0.95
Christofides(dat$z,mm,pm,dat$Pi,"mean",cl,N)



