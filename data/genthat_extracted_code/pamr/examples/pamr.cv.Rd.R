library(pamr)


### Name: pamr.cv
### Title: A function to cross-validate the nearest shrunken centroid
###   classifier
### Aliases: pamr.cv

### ** Examples

set.seed(120)
x <- matrix(rnorm(1000*20),ncol=20)
y <- sample(c(1:4),size=20,replace=TRUE)

mydata <- list(x=x,y=factor(y), geneid=as.character(1:nrow(x)),
 genenames=paste("g",as.character(1:nrow(x)),sep=""))

mytrain <-   pamr.train(mydata)
mycv <- pamr.cv(mytrain,mydata)



