library(NetworkChange)


### Name: NetworkChange
### Title: Changepoint analysis of a degree-corrected multilinear tensor
###   model
### Aliases: NetworkChange

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
##D    outlist <- list(out0, out1, out2, out3)
##D 
##D    ## The most probable model given break number 0 to 3 and data is out1 according to WAIC 
##D    WaicCompare(outlist)
##D 
##D    ## plot latent node positions
##D    plotU(out1)
##D  
##D    ## plot layer-specific network generation rules
##D    plotV(out1)
##D    
## End(Not run)



