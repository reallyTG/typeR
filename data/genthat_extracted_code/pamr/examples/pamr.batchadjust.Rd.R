library(pamr)


### Name: pamr.batchadjust
### Title: A function to mean-adjust microarray data by batches
### Aliases: pamr.batchadjust

### ** Examples

set.seed(120)
#generate some data
x <- matrix(rnorm(1000*20),ncol=20)
y <- sample(c(1:4),size=20,replace=TRUE)
batchlabels <- sample(c(1:5),size=20,replace=TRUE)
mydata <- list(x=x,y=factor(y),batchlabels=factor(batchlabels))

mydata2 <- pamr.batchadjust(mydata)



