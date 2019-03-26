library(RSurveillance)


### Name: adj.risk.sim
### Title: Adjusted risk for simulation models
### Aliases: adj.risk.sim
### Keywords: methods

### ** Examples

# examples for adj.risk.sim
its<- 10
risk.cat<- 3
rr<- matrix(0, nrow=its, ncol=risk.cat)
rr[,1]<- mc2d::rpert(its, 5,10,20)
rr[,2]<- mc2d::rpert(its, 2,3,5)
rr[,3]<- 1
ppr<- c(0.05, 0.2, 0.75)
adj.risk.sim(rr, ppr)
adj.risk.sim(matrix(c(5, 3, 1), nrow=1), matrix(c(0.1, 0.1, 0.8), nrow=1))



