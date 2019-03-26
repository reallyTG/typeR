library(COST)


### Name: Data.COST
### Title: Data Generation
### Aliases: Data.COST

### ** Examples

library(COST)
n = 500
n.total = 1001
seed1 = 22222
coord = cbind(rep(c(1,3,5)/6,each=3),rep(c(1,3,5)/6,3))
par.t = c(0,1,1,0.5,1.5,100)
dat = Data.COST(n,n.total,seed1,coord,par.t)
#it returns a data set with dimension 501*9



