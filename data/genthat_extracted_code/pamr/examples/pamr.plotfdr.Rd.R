library(pamr)


### Name: pamr.plotfdr
### Title: A function to plot the FDR curve from the nearest shrunken
###   centroid classifier
### Aliases: pamr.plotfdr

### ** Examples

set.seed(120)
x <- matrix(rnorm(1000*20),ncol=20)
y <- sample(c(1:2),size=20,replace=TRUE)
x[1:50,y==2]=x[1:50,y==2]+3
mydata <- list(x=x,y=y)
mytrain <-   pamr.train(mydata)
myfdr <-  pamr.fdr(mytrain, mydata)
pamr.plotfdr(myfdr)



