library(cccd)


### Name: cccd
### Title: Class Cover Catch Digraph
### Aliases: cccd cccd.rw cccd.classify cccd.classifier cccd.classifier.rw
###   cccd.multiclass.classifier cccd.multiclass.classify plot.cccd
###   plot.cccdClassifier
### Keywords: graphs

### ** Examples

set.seed(456330)
z <- matrix(runif(1000),ncol=2)
ind <- which(z[,1]<.5 & z[,2]<.5)
x <- z[ind,]
y <- z[-ind,]
g <- cccd(x,y)
C <- cccd.classifier(x,y)
z2 <- matrix(runif(1000),ncol=2)
ind <- which(z2[,1]<.5 & z2[,2]<.5)
cls <- rep(0,nrow(z2))
cls[ind] <- 1
out <- cccd.classify(z2,C)
sum(out != cls)/nrow(z2)
## Not run: 
##D plot(g,plot.circles=TRUE,dominate.only=TRUE)
##D points(z2,col=2*(1-cls)+1,pch=20)
## End(Not run)



