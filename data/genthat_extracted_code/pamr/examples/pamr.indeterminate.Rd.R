library(pamr)


### Name: pamr.indeterminate
### Title: A function that takes estimate class probabilities and produces
###   a class prediction or indeterminate prediction
### Aliases: pamr.indeterminate

### ** Examples

set.seed(120)
x <- matrix(rnorm(1000*20),ncol=20)
y <- sample(c(1:4),size=20,replace=TRUE)
mydata <- list(x=x,y=y)
mytrain <-   pamr.train(mydata)
prob<- pamr.predict(mytrain, mydata$x , threshold=1, type="posterior")
pamr.indeterminate(prob,mingap=.75)



