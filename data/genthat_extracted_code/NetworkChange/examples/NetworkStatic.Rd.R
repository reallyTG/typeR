library(NetworkChange)


### Name: NetworkStatic
### Title: Degree-corrected multilinear tensor model
### Aliases: NetworkStatic

### ** Examples


   ## Not run: 
##D    set.seed(1973)
##D 
##D    ## generate an array with three constant blocks
##D    Y <- MakeBlockNetworkChange(n=10, shape=10, T=10, type ="constant")
##D    G <- 100 ## Small mcmc scans to save time
##D    out0 <- NetworkStatic(Y, R=2, mcmc=G, burnin=G, verbose=G)
##D 
##D    ## recovered latent blocks
##D    Kmeans(out0, n.cluster=3, main="Recovered Blocks")
##D 
##D    ## contour plot of latent node positions
##D    plotContour(out0)
##D 
##D    ## plot latent node positions
##D    plotU(out0)
##D 
##D    ## plot layer-specific network connection rules
##D    plotV(out0)
##D    
## End(Not run)




