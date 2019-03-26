library(varSelRF)


### Name: varSelRFBoot
### Title: Bootstrap the variable selection procedure in varSelRF
### Aliases: varSelRFBoot
### Keywords: tree classif

### ** Examples

## Not run: 
##D ## This is a small example, but can take some time.
##D 
##D ## make a small cluster, for the sake of illustration
##D forkCL <- makeForkCluster(2)
##D clusterSetRNGStream(forkCL, iseed = 123)
##D clusterEvalQ(forkCL, library(varSelRF))
##D 
##D 
##D x <- matrix(rnorm(25 * 30), ncol = 30)
##D x[1:10, 1:2] <- x[1:10, 1:2] + 2
##D cl <- factor(c(rep("A", 10), rep("B", 15)))  
##D 
##D rf.vs1 <- varSelRF(x, cl, ntree = 200, ntreeIterat = 100,
##D                    vars.drop.frac = 0.2)
##D rf.vsb <- varSelRFBoot(x, cl,
##D                        bootnumber = 10,
##D                        usingCluster = TRUE,
##D                        srf = rf.vs1,
##D                        TheCluster = forkCL)
##D rf.vsb
##D summary(rf.vsb)
##D plot(rf.vsb)
##D stopCluster(forkCL)
## End(Not run)




