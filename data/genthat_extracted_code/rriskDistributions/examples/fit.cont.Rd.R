library(rriskDistributions)


### Name: fit.cont
### Title: GUI for fitting continuous distributions to given data
### Aliases: fit.cont
### Keywords: gui

### ** Examples

## Not run: 
##D   if ( class(tcltk::tclRequire("Tktable")) == "tclObj" ) {
##D     res1 <- fit.cont(data2fit = rgamma(374, 4, 0.08))
##D     res1
##D 
##D     res2 <- fit.cont(data2fit = rbeta(300, shape1 = 1, shape2 = 2))
##D     res2
##D 
##D     res3 <- fit.cont(data2fit = mc2d::rtriang(300, min = 1, mode = 3, max = 10))
##D     res3
##D 
##D     res4 <- fit.cont(data2fit = stats::rnorm(300))
##D     res4
##D   }
## End(Not run)




