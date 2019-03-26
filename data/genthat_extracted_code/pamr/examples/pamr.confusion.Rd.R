library(pamr)


### Name: pamr.confusion
### Title: A function giving a table of true versus predicted values, from
###   a nearest shrunken centroid fit.
### Aliases: pamr.confusion

### ** Examples

set.seed(120)
x <- matrix(rnorm(1000*20),ncol=20)
y <- sample(c(1:4),size=20,replace=TRUE)
mydata <- list(x=x,y=y)
mytrain <-   pamr.train(mydata)
mycv <- pamr.cv(mytrain,mydata)
pamr.confusion(mytrain,  threshold=2)
pamr.confusion(mycv,  threshold=2)
 



