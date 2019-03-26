library(Chaos01)


### Name: testChaos01
### Title: Function to compute 0-1 test for chaos
### Aliases: testChaos01
### Keywords: chaos, test

### ** Examples

TS <- gen.logistic(mu = 3.55, iter = 2000)

#The median of Kc
res <- testChaos01(TS)
print(res)

#Output for each value of c
res2 <- testChaos01(TS, out = TRUE)

summary(res2[[1]])
head(res2[[1]]$pc)
print(res2[[1]]$Kc)

class(res2)
class(res2[[1]])

## Not run: 
##D #Introducing noise
##D TS2 <- TS + runif(2000, 0, 0.1)
##D 
##D res.orig <- testChaos01(TS2, alpha = 0)
##D res.damp <- testChaos01(TS2, alpha = 2.5)
##D 
##D sprintf(Original test result %s\n Dampened test result %s, res.orig, res.damp)
##D 
##D #Parallel
##D res <- testChaos01(TS, par = "parallel", num.treads = 2)
##D 
##D #Parallel cluster
##D res <- testChaos01(TS, par = "MPI", num.treads = 2)
##D Rmpi::mpi.finalize()
##D 
##D #Different interval for generating c
##D res <- testChaos01(TS, c.int = c(0, pi))
## End(Not run)



