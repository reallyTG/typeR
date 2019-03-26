library(pamr)


### Name: pamr.predictmany
### Title: A function giving prediction information for many threshold
###   values, from a nearest shrunken centroid fit.
### Aliases: pamr.predictmany

### ** Examples

set.seed(120)
x <- matrix(rnorm(1000*20),ncol=20)
y <- sample(c(1:4),size=20,replace=TRUE)
mydata <- list(x=x,y=y)
mytrain <-   pamr.train(mydata)

pamr.predictmany(mytrain, mydata$x)
 



