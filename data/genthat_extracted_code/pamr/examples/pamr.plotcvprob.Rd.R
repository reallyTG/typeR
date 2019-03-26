library(pamr)


### Name: pamr.plotcvprob
### Title: A function to plot the cross-validated sample probabilities from
###   the nearest shrunken centroid classifier
### Aliases: pamr.plotcvprob

### ** Examples

set.seed(120)
x <- matrix(rnorm(1000*20),ncol=20)
y <- sample(c(1:4),size=20,replace=TRUE)
mydata <- list(x=x,y=y)
mytrain <-   pamr.train(mydata)
mycv <-  pamr.cv(mytrain,mydata)
pamr.plotcvprob(mycv,mydata,threshold=1.6)






