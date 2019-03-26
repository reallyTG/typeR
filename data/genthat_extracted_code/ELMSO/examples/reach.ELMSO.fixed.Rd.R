library(ELMSO)


### Name: reach.ELMSO.fixed
### Title: Calculating Reach from Fixed ELMSO Function
### Aliases: reach.ELMSO.fixed

### ** Examples

z=matrix(round(abs(rnorm(5000,0,0.7))),1000,5)
CPM.fixed=c(3,4,5,6,7)
tau.values=rep(100,5) #Note tau here is in thousands of pageviews

allocation=ELMSO.fixed(z=z,CPM=CPM.fixed,tau=tau.values)
reach.ELMSO.fixed(CPM.fixed,allocation$spend[,101],z,tau.values)





