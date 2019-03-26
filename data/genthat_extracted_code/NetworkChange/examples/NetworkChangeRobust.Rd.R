library(NetworkChange)


### Name: NetworkChangeRobust
### Title: Changepoint analysis of a degree-corrected multilinear tensor
###   model with t-distributed error
### Aliases: NetworkChangeRobust

### ** Examples


   ## Not run: 
##D    set.seed(1973)
##D    ## Generate an array (30 by 30 by 40) with block transitions
##D    from 2 blocks to 3 blocks
##D    Y <- MakeBlockNetworkChange(n=10, T=40, type ="split")
##D    G <- 100 ## only 100 mcmc scans to save time
##D    ## Fit models
##D    out1 <- NetworkChangeRobust(Y, R=2, m=1, mcmc=G, burnin=G, verbose=G)
##D    ## plot latent node positions
##D    plotU(out1)
##D    ## plot layer-specific network generation rules
##D    plotV(out1)
##D    
## End(Not run)



