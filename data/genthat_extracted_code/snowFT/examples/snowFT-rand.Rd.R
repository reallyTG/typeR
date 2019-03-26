library(snowFT)


### Name: snowFT-rand
### Title: Random Number Generation
### Aliases: clusterSetupRNG.FT clusterSetupRNGstreamRepli
### Keywords: programming

### ** Examples

## Not run: 
##D # Generate 50 independent (normally distributed) random numbers 
##D # on 3 nodes using 10 RNG streams
##D cl <- makeClusterFT(3)
##D r <- 10
##D # reproducible results
##D for (i in 1:3) {
##D     clusterSetupRNG.FT(cl, streamper = "replicate", n = r, seed = 123)
##D     cat("\n")
##D     print(unlist(clusterApplyFT(cl, rep(5,r), rnorm, gentype = "RNGstream")[[1]]))
##D     
##D }
##D 
##D # non-reproducible results (method used in snow)
##D for (i in 1:3) {
##D     clusterSetupRNG.FT(cl, streamper = "node", seed = 123)
##D     cat("\n")
##D     print(unlist(clusterApplyFT(cl, rep(5,r), rnorm, gentype = "RNGstream")[[1]]))
##D }
##D stopClusterFT(cl)
## End(Not run)



