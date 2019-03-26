library(cba)


### Name: ccfkms
### Title: Clustering with Conjugate Convex Functions
### Aliases: ccfkms
### Keywords: cluster

### ** Examples

### extend proximus example
x <- rlbmat()
rownames(x) <- seq(dim(x)[1])
cm <- ccfkms(x, n=4, opt.retry=10)
pcm <- predict(cm, x)
## Not run: 
##D ### using sparse data may be more time-efficient
##D ### depending on the goodness of the implementation
##D ### of subset, etc. in package Matrix.
##D require(Matrix)
##D #sx <- as(x, "dgRMatrix")    # currently broken
##D sx <- as(x, "dgCMatrix")
##D system.time(scm <- ccfkms(sx, n=4, opt.retry=50))
##D system.time(cm <- ccfkms(x, n=4, opt.retry=50))
## End(Not run)



