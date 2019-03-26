library(GPareto)


### Name: nonDomSet
### Title: Non-dominated points with respect to a reference
### Aliases: nonDomSet

### ** Examples

## Not run: 
##D d <- 6
##D n <- 1000
##D n2 <- 1000
##D 
##D test <- matrix(runif(d * n), n)
##D ref <- matrix(runif(d * n), n)
##D indPF <- nonDomInd(ref)
##D 
##D system.time(res <- nonDomSet(test, ref[indPF,,drop = F]))
##D 
##D res2 <- rep(NA, n2)
##D library(emoa)
##D t0 <- Sys.time()
##D for(i in 1:n2){
##D   res2[i] <- !is_dominated(t(rbind(test[i,, drop = F], ref[indPF,])))[1]
##D }
##D print(Sys.time() - t0)
##D 
##D all(res == res2)
## End(Not run)



