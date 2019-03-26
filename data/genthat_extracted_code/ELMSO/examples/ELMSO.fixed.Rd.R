library(ELMSO)


### Name: ELMSO.fixed
### Title: Fixed ELMSO Function (fixed advertising costs, no cost curve)
### Aliases: ELMSO.fixed

### ** Examples

z=matrix(round(abs(rnorm(5000,0,0.7))),1000,5)
CPM.fixed=c(3,4,5,6,7)
tau.values=rep(100,5) #Note tau here is in thousands of pageviews

allocation=ELMSO.fixed(z=z,CPM=CPM.fixed,tau=tau.values)
allocation$spend
allocation$budget
allocation$lambda



