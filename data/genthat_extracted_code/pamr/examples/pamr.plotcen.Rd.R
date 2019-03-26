library(pamr)


### Name: pamr.plotcen
### Title: A function to plot the shrunken class centroids, from the
###   nearest shrunken centroid classifier
### Aliases: pamr.plotcen

### ** Examples

set.seed(120)
x <- matrix(rnorm(1000*20),ncol=20)
y <- sample(c(1:4),size=20,replace=TRUE)
mydata <- list(x=x,y=y,genenames=as.character(1:1000))
mytrain <-   pamr.train(mydata)
mycv <- pamr.cv(mytrain,mydata)
pamr.plotcen(mytrain, mydata,threshold=1.6)
 



