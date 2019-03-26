library(VCA)


### Name: Solve
### Title: Solve System of Linear Equations using Inverse of Cholesky-Root.
### Aliases: Solve

### ** Examples

## Not run: 
##D # following complex (nonsense) model takes pretty long to fit
##D system.time(res.sw <- anovaVCA(y~(sample+lot+device)/day/run, VCAdata1))
##D # solve mixed model equations (not automatically done to be more efficient)
##D system.time(res.sw <- solveMME(res.sw))
##D # extract covariance matrix of observations V
##D V1 <- getMat(res.sw, "V")
##D V2 <- as.matrix(V1)
##D system.time(V2i <- solve(V2))
##D system.time(V1i <- VCA:::Solve(V1))
##D V1i <- as.matrix(V1i)
##D dimnames(V1i) <- NULL
##D dimnames(V2i) <- NULL
##D all.equal(V1i, V2i)
## End(Not run) 



