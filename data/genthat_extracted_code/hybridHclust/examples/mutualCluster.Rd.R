library(hybridHclust)


### Name: mutualCluster
### Title: Find mutual clusters
### Aliases: mutualCluster
### Keywords: cluster

### ** Examples

x <- cbind(c(-1.4806,1.5772,-0.9567,-0.92,-1.9976,-0.2723,-0.3153),
           c(-0.6283,-0.1065,0.428,-0.7777,-1.2939,-0.7796,0.012))
par(mfrow=c(1,2))
plot(x,pch=as.character(1:nrow(x)),asp=1) # show data 
dist(x) # you can verify that mc's are correct 
mutualCluster(x,plot=TRUE) # find MCs and indicate them in dendrogram plot



