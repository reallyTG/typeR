library(varSelRF)


### Name: plot.varSelRFBoot
### Title: plot a varSelRFBoot object
### Aliases: plot.varSelRFBoot
### Keywords: tree classif

### ** Examples

## Not run: 
##D ## This is a small example, but can take some time.
##D 
##D x <- matrix(rnorm(25 * 30), ncol = 30)
##D x[1:10, 1:2] <- x[1:10, 1:2] + 2
##D cl <- factor(c(rep("A", 10), rep("B", 15)))  
##D 
##D rf.vs1 <- varSelRF(x, cl, ntree = 200, ntreeIterat = 100,
##D                    vars.drop.frac = 0.2)
##D rf.vsb <- varSelRFBoot(x, cl,
##D                        bootnumber = 10,
##D                        usingCluster = FALSE,
##D                        srf = rf.vs1)
##D rf.vsb
##D summary(rf.vsb)
##D plot(rf.vsb)
## End(Not run)



