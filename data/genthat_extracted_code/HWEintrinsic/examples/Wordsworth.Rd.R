library(HWEintrinsic)


### Name: Wordsworth
### Title: Wordsworth et al. (1992) Four Alleles Data
### Aliases: Wordsworth
### Keywords: datasets HWE

### ** Examples

# Example 1 #
## Not run: 
##D # ATTENTION: the following code may take a long time to run! #
##D 
##D 
##D data(Wordsworth)
##D plot(Wordsworth)
##D n <- sum(Wordsworth@data.vec, na.rm = TRUE)
##D out <- hwe.ibf.mc(Wordsworth, t = n/2, M = 100000, verbose = TRUE)
##D summary(out, plot = TRUE)
## End(Not run)

# Example 2 #
## Not run: 
##D # ATTENTION: the following code may take a long time to run! #
##D 
##D data(Wordsworth)
##D n <- sum(Wordsworth@data.vec, na.rm = TRUE)
##D M <- 300000
##D f <- seq(.1, 1, .05)
##D out <- hwe.ibf.plot(y = Wordsworth, t.vec = round(f*n), M = M)
## End(Not run)



