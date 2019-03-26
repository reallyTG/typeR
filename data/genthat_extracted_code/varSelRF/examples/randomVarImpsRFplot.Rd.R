library(varSelRF)


### Name: randomVarImpsRFplot
### Title: Plot random random variable importances
### Aliases: randomVarImpsRFplot
### Keywords: tree classif

### ** Examples


x <- matrix(rnorm(45 * 30), ncol = 30)
x[1:20, 1:2] <- x[1:20, 1:2] + 2
colnames(x) <- paste0("V", seq.int(ncol(x)))
cl <- factor(c(rep("A", 20), rep("B", 25)))  

rf <- randomForest(x, cl, ntree = 200, importance = TRUE)
rf.rvi <- randomVarImpsRF(x, cl, 
                          rf, 
                          numrandom = 20, 
                          usingCluster = FALSE) 

randomVarImpsRFplot(rf.rvi, rf)
op <- par(las = 2)
randomVarImpsRFplot(rf.rvi, rf, show.var.names = TRUE)
par(op)


## Not run: 
##D ## identical, but using a cluster
##D ## make a small cluster, for the sake of illustration
##D psockCL <- makeCluster(2, "PSOCK")
##D clusterSetRNGStream(psockCL, iseed = 789)
##D clusterEvalQ(psockCL, library(varSelRF))
##D 
##D rf.rvi <- randomVarImpsRF(x, cl, 
##D                           rf, 
##D                           numrandom = 20, 
##D                           usingCluster = TRUE,
##D                           TheCluster = psockCL) 
##D 
##D randomVarImpsRFplot(rf.rvi, rf)
##D stopCluster(psockCL)
## End(Not run)




