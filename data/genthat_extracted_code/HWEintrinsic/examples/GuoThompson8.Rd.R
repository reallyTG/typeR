library(HWEintrinsic)


### Name: GuoThompson8
### Title: Guo and Thompson (1992) Eight Alleles Simulated Data
### Aliases: GuoThompson8
### Keywords: datasets HWE

### ** Examples

# Example 1 #
## Not run: 
##D # ATTENTION: the following code may take a long time to run! #
##D 
##D 
##D data(GuoThompson8)
##D plot(GuoThompson8)
##D n <- sum(GuoThompson8@data.vec, na.rm = TRUE)
##D out <- hwe.ibf.mc(GuoThompson8, t = n/2, M = 100000, verbose = TRUE)
##D summary(out, plot = TRUE)
## End(Not run)

# Example 2 #
## Not run: 
##D # ATTENTION: the following code may take a long time to run! #
##D 
##D M <- 300000
##D f <- seq(.1, 1, .05)
##D n <- sum(GuoThompson8@data.vec, na.rm = TRUE)
##D out <- hwe.ibf.plot(y = GuoThompson8, t.vec = round(f*n), M = M)
## End(Not run)



