library(NetworkChange)


### Name: plotContour
### Title: Contour plot of latent node positions
### Aliases: plotContour

### ** Examples


   ## Not run: 
##D set.seed(1973)
##D    ## generate an array with two constant blocks
##D    Y <- MakeBlockNetworkChange(n=10, shape=10, T=40, type ="constant")
##D    out0 <- NetworkStatic(Y, R=2, mcmc=10, burnin=10,
##D    verbose=10, UL.Normal = "Orthonormal")
##D    ## contour plot of latent node positions
##D    plotContour(out0)
##D    
## End(Not run)



