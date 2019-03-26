library(NetworkChange)


### Name: plotV
### Title: Plot of layer-specific network generation rules.
### Aliases: plotV

### ** Examples


   ## Not run: 
##D set.seed(1973)
##D    ## generate an array with two constant blocks
##D    Y <- MakeBlockNetworkChange(n=10, shape=10, T=40, type ="constant")
##D    out0 <- NetworkStatic(Y, R=2, mcmc=10, burnin=10,
##D    verbose=10, UL.Normal = "Orthonormal")
##D    ## latent node positions
##D    plotV(out0)
##D    
## End(Not run)



