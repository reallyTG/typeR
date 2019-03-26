library(dimRed)


### Name: DRR-class
### Title: Dimensionality Reduction via Regression
### Aliases: DRR-class DRR

### ** Examples

## Not run: 
##D dat <- loadDataSet("variable Noise Helix", n = 200)[sample(200)]
##D 
##D ## use the S4 Class directly:
##D drr <- DRR()
##D pars <- drr@stdpars
##D pars$ndim <- 3
##D emb <- drr@fun(dat, pars)
##D 
##D ## simpler, use embed():
##D emb2 <- embed(dat, "DRR", ndim = 3)
##D 
##D 
##D plot(dat, type = "3vars")
##D plot(emb, type = "3vars")
##D plot(emb@inverse(emb@data@data[, 1, drop = FALSE]), type = "3vars")
## End(Not run)





