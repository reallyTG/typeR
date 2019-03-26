library(dimRed)


### Name: MDS-class
### Title: Metric Dimensional Scaling
### Aliases: MDS-class MDS

### ** Examples

## Not run: 
##D dat <- loadDataSet("3D S Curve")
##D 
##D ## Use the S4 Class directly:
##D mds <- MDS()
##D emb <- mds@fun(dat, mds@stdpars)
##D 
##D ## use embed():
##D emb2 <- embed(dat, "MDS", d = function(x) exp(stats::dist(x)))
##D 
##D 
##D plot(emb, type = "2vars")
##D plot(emb2, type = "2vars")
## End(Not run)



