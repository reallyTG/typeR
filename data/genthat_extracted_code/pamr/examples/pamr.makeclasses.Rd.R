library(pamr)


### Name: pamr.makeclasses
### Title: A function to interactively define classes from a clustering
###   tree
### Aliases: pamr.makeclasses

### ** Examples

set.seed(120)
#generate some data
x <- matrix(rnorm(1000*40),ncol=40)
y <- sample(c(1:4),size=40,replace=TRUE)
batchlabels <- sample(c(1:5),size=40,replace=TRUE)

mydata <- list(x=x,y=factor(y),batchlabels=factor(batchlabels),
               geneid=as.character(1:nrow(x)),
               genenames=paste("g",as.character(1:nrow(x)),sep=""))

# mydata$newy <- pamr.makeclasses(mydata) Run this and define some new classes

train <- pamr.train(mydata)



