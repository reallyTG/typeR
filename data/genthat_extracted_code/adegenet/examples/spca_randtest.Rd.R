library(adegenet)


### Name: spca_randtest
### Title: Monte Carlo test for sPCA
### Aliases: spca_randtest

### ** Examples


## Not run: 
##D ## Load data
##D data(sim2pop)
##D 
##D ## Make spca
##D spca1 <- spca(sim2pop, type = 1, scannf = FALSE, plot.nb = FALSE)
##D 
##D spca1
##D plot(spca1)
##D 
##D ## run tests (use more permutations in practice, e.g. 999)
##D tests <- spca_randtest(spca1, nperm = 49)
##D 
##D ## check results
##D tests
##D plot(tests[[1]]) # global structures
##D 
## End(Not run)




