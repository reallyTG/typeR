library(randomLCA)


### Name: hivtests
### Title: HIV testing data
### Aliases: hivtests
### Keywords: datasets

### ** Examples

## Not run: 
##D # fit standard latent class
##D hivtests.lca2 <- randomLCA(hivtests[,1:4],freq=hivtests$freq)
##D # with random effect and constant laoding
##D hivtests.lca2random <- randomLCA(hivtests[,1:4],freq=hivtests$freq,random=TRUE,penalty=1.0)
##D # with random effect and variable loading
##D # for this model there are 13 parameters fitted to 16 observations, so model is fairly unstable
##D hivtests.lca2random2 <- randomLCA(hivtests[,1:4],freq=hivtests$freq,random=TRUE,
##D     constload=FALSE,penalty=1.0)
##D # BIC shows best model is random effects with constant loading
##D print(c(BIC(hivtests.lca2),BIC(hivtests.lca2random),BIC(hivtests.lca2random2)))
## End(Not run)



