library(HWEintrinsic)


### Name: hwe.ibf
### Title: Testing Hardy-Weinberg Equilibrium Using an Intrinsic Prior
###   Approach
### Aliases: hwe.ibf
### Keywords: Bayes Factor intrinsic prior Hardy-Weinberg HWE

### ** Examples

## Not run: 
##D # ATTENTION: the following code may take a long time to run! #
##D 
##D data(Lindley)
##D hwe.ibf.exact <- Vectorize(hwe.ibf, "t")
##D f <- seq(.05, 1, .05)
##D n <- sum(dataL1@data.vec, na.rm = TRUE)
##D 
##D # Dataset 1 #
##D plot(dataL1)
##D npp.exact <- 1/(1 + hwe.ibf.exact(round(f*n), y = dataL1))
##D npp.std <- 1/(1 + hwe.bf(dataL1))
##D plot(f, npp.exact, type="l", lwd = 2, xlab = "f = t/n",
##D 	ylab = "Null posterior probability")
##D abline(h = npp.std, col = gray(.5), lty = "longdash")
##D 
##D # Dataset 2 #
##D plot(dataL2)
##D npp.exact <- 1/(1 + hwe.ibf.exact(round(f*n), y = dataL2))
##D npp.std <- 1/(1 + hwe.bf(dataL2))
##D plot(f, npp.exact, type="l", lwd = 2, xlab = "f = t/n",
##D 	ylab = "Null posterior probability")
##D abline(h = npp.std, col = gray(.5), lty = "longdash")
##D 
##D # Dataset 3 #
##D plot(dataL3)
##D npp.exact <- 1/(1 + hwe.ibf.exact(round(f*n), y = dataL3))
##D npp.std <- 1/(1 + hwe.bf(dataL3))
##D plot(f, npp.exact, type="l", lwd = 2, xlab = "f = t/n",
##D 	ylab = "Null posterior probability")
##D abline(h = npp.std, col = gray(.5), lty = "longdash")
##D 
##D # Dataset 4 #
##D plot(dataL4)
##D npp.exact <- 1/(1 + hwe.ibf.exact(round(f*n), y = dataL4))
##D npp.std <- 1/(1 + hwe.bf(dataL4))
##D plot(f, npp.exact, type="l", lwd = 2, xlab = "f = t/n",
##D 	ylab = "Null posterior probability")
##D abline(h = npp.std, col = gray(.5), lty = "longdash")
## End(Not run)



