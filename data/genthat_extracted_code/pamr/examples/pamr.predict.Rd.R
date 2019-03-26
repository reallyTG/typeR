library(pamr)


### Name: pamr.predict
### Title: A function giving prediction information, from a nearest
###   shrunken centroid fit.
### Aliases: pamr.predict

### ** Examples

set.seed(120)
x <- matrix(rnorm(1000*20),ncol=20)
y <- sample(c(1:4),size=20,replace=TRUE)
mydata <- list(x=x,y=y)
mytrain <-   pamr.train(mydata)
mycv <- pamr.cv(mytrain,mydata)
pamr.predict(mytrain, mydata$x , threshold=1)
 



