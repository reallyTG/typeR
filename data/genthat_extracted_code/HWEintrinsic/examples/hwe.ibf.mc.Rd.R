library(HWEintrinsic)


### Name: hwe.ibf.mc
### Title: Testing Hardy-Weinberg Equilibrium Using an Intrinsic Prior
###   Approach
### Aliases: hwe.ibf.mc
### Keywords: Bayes Factor intrinsic prior Hardy-Weinberg HWE

### ** Examples

# Example 1 #
## Not run: 
##D # ATTENTION: the following code may take a long time to run! #
##D 
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



