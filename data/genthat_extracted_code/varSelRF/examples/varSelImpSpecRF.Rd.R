library(varSelRF)


### Name: varSelImpSpecRF
### Title: Variable selection using the "importance spectrum"
### Aliases: varSelImpSpecRF
### Keywords: tree classif

### ** Examples

x <- matrix(rnorm(45 * 30), ncol = 30)
x[1:20, 1:2] <- x[1:20, 1:2] + 2
cl <- factor(c(rep("A", 20), rep("B", 25)))  

rf <- randomForest(x, cl, ntree = 200, importance = TRUE)
rf.rvi <- randomVarImpsRF(x, cl, 
                          rf, 
                          numrandom = 20, 
                          usingCluster = FALSE) 
varSelImpSpecRF(rf, randomImps = rf.rvi)



## Not run: 
##D ## Identical, but using a cluster
##D psockCL <- makeCluster(2, "PSOCK")
##D clusterSetRNGStream(psockCL, iseed = 456)
##D clusterEvalQ(psockCL, library(varSelRF))
##D 
##D rf.rvi <- randomVarImpsRF(x, cl, 
##D                           rf, 
##D                           numrandom = 20, 
##D                           usingCluster = TRUE,
##D                           TheCluster = psockCL) 
##D varSelImpSpecRF(rf, randomImps = rf.rvi)
##D stopCluster(psockCL)
##D 
## End(Not run)






