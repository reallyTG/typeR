library(ELMSO)


### Name: ELMSO
### Title: Main ELMSO Function
### Aliases: ELMSO

### ** Examples

z=matrix(round(abs(rnorm(5000,0,0.7))),1000,5)
CPM.avg=c(3,4,5,6,7)
tau.values=rep(1000,5) #Note tau here is in thousands of pageviews

allocation=ELMSO(z=z,CPM=CPM.avg,tau=tau.values)
allocation$bid
allocation$spend
allocation$budget
allocation$lambda
allocation$a



