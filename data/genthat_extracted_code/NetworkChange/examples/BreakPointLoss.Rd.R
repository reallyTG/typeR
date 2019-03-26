library(NetworkChange)


### Name: BreakPointLoss
### Title: Compute the Average Loss of Hidden State Changes from Expected
###   Break Points
### Aliases: BreakPointLoss

### ** Examples

   ## Not run: 
##D    set.seed(1973)
##D    ## Generate an array (30 by 30 by 40) with block transitions
##D    from 2 blocks to 3 blocks
##D    Y <- MakeBlockNetworkChange(n=10, T=40, type ="split")
##D    G <- 100 ## Small mcmc scans to save time
##D 
##D    ## Fit multiple models for break number detection using Bayesian model comparison
##D    out0 <- NetworkStatic(Y, R=2, mcmc=G, burnin=G, verbose=G, Waic=TRUE)
##D    out1 <- NetworkChange(Y, R=2, m=1, mcmc=G, burnin=G, verbose=G, Waic=TRUE)
##D    out2 <- NetworkChange(Y, R=2, m=2, mcmc=G, burnin=G, verbose=G, Waic=TRUE)
##D    out3 <- NetworkChange(Y, R=2, m=3, mcmc=G, burnin=G, verbose=G, Waic=TRUE)
##D 
##D    ## The most probable model given break number 0 to 3 and data is out1 according to WAIC 
##D    out <- BreakPointLoss(out0, out1, out2, out3, waic=TRUE)
##D 
##D    print(out[["ave.loss"]])
## End(Not run)





