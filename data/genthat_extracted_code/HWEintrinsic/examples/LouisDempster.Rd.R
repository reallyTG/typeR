library(HWEintrinsic)


### Name: LouisDempster
### Title: Louis and Dempster (1987) Four Alleles Data
### Aliases: LouisDempster
### Keywords: datasets HWE

### ** Examples

# Example 1 #
## Not run: 
##D # ATTENTION: the following code may take a long time to run! #
##D 
##D 
##D data(LouisDempster)
##D plot(LouisDempster)
##D n <- sum(LouisDempster@data.vec, na.rm = TRUE)
##D out <- hwe.ibf.mc(LouisDempster, t = n/2, M = 100000, verbose = TRUE)
##D summary(out, plot = TRUE)
## End(Not run)

# Example 2 #
## Not run: 
##D # ATTENTION: the following code may take a long time to run! #
##D 
##D M <- 300000
##D f <- seq(.1, 1, .05)
##D n <- sum(LouisDempster@data.vec, na.rm = TRUE)
##D out <- hwe.ibf.plot(y = LouisDempster, t.vec = round(f*n), M = M)
## End(Not run)



