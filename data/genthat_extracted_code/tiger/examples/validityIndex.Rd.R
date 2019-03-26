library(tiger)


### Name: validityIndex
### Title: Validity Index for fuzzy clustering
### Aliases: validityIndex
### Keywords: utilities

### ** Examples

myOrig <- matrix(c(c(1,0,0,1),
         c(0,0,1,2),
         c(1,1,0,3)), nrow=3, ncol=4, byrow=TRUE)


myData <- rbind(
     matrix(myOrig[1,], nrow=50, ncol=4, byrow=TRUE),
     matrix(myOrig[2,], nrow=50, ncol=4, byrow=TRUE),
     matrix(myOrig[3,], nrow=50, ncol=4, byrow=TRUE)
     )
str(myData)
myData[,1:3] <- myData[,1:3] + rnorm(3*150)*0.3
myData

maxc <- 10

require(e1071)
    validity <- rep(NA, maxc)
    all.cluster.rer <- list()
    for(centers in 2:maxc){
        cluster.rer<-cmeans(x=myData, centers=centers, method="cmeans", m=2)
        validity[centers] <- validityIndex(cluster.rer , myData)
        all.cluster.rer[[centers]] <- cluster.rer
    }

  plot(validity, type="l")
 



