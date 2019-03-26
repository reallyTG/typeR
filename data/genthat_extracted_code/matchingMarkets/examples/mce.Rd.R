library(matchingMarkets)


### Name: mce
### Title: MC Experiments
### Aliases: mce

### ** Examples

## Not run: 
##D ## 1. Set parameters
##D mciter <- 2 #500
##D niter <- 10 #400000
##D nodes <- 4
##D 
##D ## 2. Setup parallel backend to use 4 processors
##D library(foreach); library(doSNOW)
##D cl <- makeCluster(4); registerDoSNOW(cl)
##D 
##D ## 3. Define foreach loop function
##D mce.add <- function(mciter, niter, N, n, m, type, method){
##D   h <- foreach(i=1:mciter) %dopar% {
##D     library(matchingMarkets)
##D     mce(seed=i,niter, N, n, m, type, method)
##D   }
##D   do.call(rbind, h)
##D }
##D 
##D ## 4. Run siumlations:
##D 
##D ## 4-a. Benchmark study
##D exp.5.5.ols <- mce.add(mciter=mciter, niter=niter, N=5, n=5, m=40,
##D                        type="group.members", method="outcome")
##D exp.5.5.ntu <- mce.add(mciter=mciter, niter=niter, N=5, n=5, m=40, 
##D                        type="group.members", method="NTU")
##D 
##D ## 4-b. Experiment 1: randomly sampled group members
##D exp.6.5.ols <- mce.add(mciter=mciter, niter=niter, N=6, n=5, m=40,
##D                        type="group.members", method="outcome")
##D exp.6.5.ntu <- mce.add(mciter=mciter, niter=niter, N=6, n=5, m=40,
##D                        type="group.members", method="NTU")
##D 
##D ## 4-c. Experiment 2: randomly sampled counterfactual groups
##D exp.6.6.ols <- mce.add(mciter=mciter, niter=niter, N=6, n=6, m=40, 
##D                        type="counterfactual.groups", method="outcome")
##D exp.6.6.ntu <- mce.add(mciter=mciter, niter=niter, N=6, n=6, m=40, 
##D                        type="counterfactual.groups", method="NTU")
##D 
##D ## 5. Stop parallel backend
##D stopCluster(cl)
## End(Not run)



