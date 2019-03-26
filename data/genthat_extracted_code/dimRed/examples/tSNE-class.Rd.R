library(dimRed)


### Name: tSNE-class
### Title: t-Distributed Stochastic Neighborhood Embedding
### Aliases: tSNE-class tSNE

### ** Examples

## Not run: 
##D dat <- loadDataSet("3D S Curve", n = 500)
##D 
##D ## using the S4 class directly:
##D tsne <- tSNE()
##D emb <- tsne@fun(dat, tsne@stdpars)
##D 
##D ## using embed()
##D emb2 <- embed(dat, "tSNE", perplexity = 80)
##D 
##D plot(emb, type = "2vars")
##D plot(emb2, type = "2vars")
## End(Not run)



