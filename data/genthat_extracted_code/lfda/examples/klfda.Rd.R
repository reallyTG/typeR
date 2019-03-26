library(lfda)


### Name: klfda
### Title: Kernel Local Fisher Discriminant Analysis for Supervised
###   Dimensionality Reduction
### Aliases: klfda
### Keywords: discriminant fisher klfda local mahalanobis metric
###   transformation

### ** Examples

## Not run: 
##D ## example without dimension reduction
##D k <- kmatrixGauss(x = trainData[,-1])
##D y <- trainData[,1]
##D r <- 26 # dimensionality of reduced space. Here no dimension reduction is performed
##D result <- klfda(k,y,r,metric="plain")
##D transformedMat <- result$Z # transformed training data
##D metric.train <- as.data.frame(cbind(trainData[,1],transformedMat))
##D colnames(metric.train)=colnames(trainData)
##D 
##D ## example with dimension reduction
##D k <- kmatrixGauss(x = trainData[,-1])
##D y <- trainData[,1]
##D r <- 3 # dimensionality of reduced space
##D result <- klfda(k,y,r,metric="plain")
##D transformMat  <- result$T # transforming matrix - distance metric
##D 
##D # transformed training data with Style
##D transformedMat <- result$Z # transformed training data
##D metric.train <- as.data.frame(cbind(trainData[,1],transformedMat))
##D colnames(metric.train)[1] <- "Style"
##D 
##D # transformed testing data with Style (unfinished)
##D metric.test <- kmatrixGauss(x = testData[,-1])
##D metric.test <- as.matrix(testData[,-1]) %*% transformMat
##D metric.test <- as.data.frame(cbind(testData[,1],metric.test))
##D colnames(metric.test)[1] <- "Style"
##D 
## End(Not run)




