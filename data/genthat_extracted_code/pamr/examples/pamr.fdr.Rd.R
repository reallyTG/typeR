library(pamr)


### Name: pamr.fdr
### Title: A function to estimate false discovery rates for the nearest
###   shrunken centroid classifier
### Aliases: pamr.fdr

### ** Examples

set.seed(120)
x <- matrix(rnorm(1000*20),ncol=20)
y <- sample(c(1:4),size=20,replace=TRUE)

mydata <- list(x=x,y=factor(y), geneid=as.character(1:nrow(x)),
               genenames=paste("g",as.character(1:nrow(x)),sep=""))

mytrain <-   pamr.train(mydata)
myfdr <- pamr.fdr(mytrain, mydata)



