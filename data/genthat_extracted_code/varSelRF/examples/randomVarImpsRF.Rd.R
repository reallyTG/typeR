library(varSelRF)


### Name: randomVarImpsRF
### Title: Variable importances from random forest on permuted class labels
### Aliases: randomVarImpsRF
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

randomVarImpsRFplot(rf.rvi, rf)



