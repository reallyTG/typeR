library(HWEintrinsic)


### Name: GuoThompson9
### Title: Guo and Thompson (1992) Nine Alleles Data
### Aliases: GuoThompson9
### Keywords: datasets HWE

### ** Examples

# Example 1 #
## Not run: 
##D # ATTENTION: the following code may take a long time to run! #
##D 
##D data(GuoThompson9)
##D plot(GuoThompson9)
##D n <- sum(GuoThompson9@data.vec, na.rm = TRUE)
##D out <- hwe.ibf.mc(GuoThompson9, t = n/2, M = 100000, verbose = TRUE)
##D summary(out, plot = TRUE)
## End(Not run)

# Example 2 #
## Not run: 
##D # ATTENTION: the following code may take a long time to run! #
##D 
##D M <- 300000
##D f <- seq(.1, 1, .05)
##D n <- sum(GuoThompson9@data.vec, na.rm = TRUE)
##D out <- hwe.ibf.plot(y = GuoThompson9, t.vec = round(f*n), M = M)
## End(Not run)



