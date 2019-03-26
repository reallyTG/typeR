library(bmrm)


### Name: mmc
### Title: Convenient wrapper function to solve max-margin clustering
###   problem on a dataset
### Aliases: mmc

### ** Examples

   # -- Prepare a 2D dataset to cluster with an intercept
   x <- cbind(intercept=100,scale(data.matrix(iris[c(1,3)]),center=TRUE,scale=FALSE))

   # -- Find max-margin clusters
   y <- mmc(x,k=3,LAMBDA=0.001,minClusterSize=10,seeds=5)
   table(y,iris$Species)
   
   # -- Plot the dataset and the MMC decision boundaries
   gx <- seq(min(x[,2]),max(x[,2]),length=100)
   gy <- seq(min(x[,3]),max(x[,3]),length=100)
   Y <- outer(gx,gy,function(a,b){predict(y,cbind(100,a,b))})
   image(gx,gy,Y,asp=1,main="MMC clustering",xlab=colnames(x)[1],ylab=colnames(x)[2])
   points(x[,-1],pch=19+y)



