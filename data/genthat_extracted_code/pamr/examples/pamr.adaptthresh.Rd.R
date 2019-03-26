library(pamr)


### Name: pamr.adaptthresh
### Title: A function to adaptive choose threshold scales, for use in
###   pamr.train
### Aliases: pamr.adaptthresh

### ** Examples

set.seed(120)
x <- matrix(rnorm(1000*20),ncol=20)
y <- sample(c(1:4),size=20,replace=TRUE)
mydata <- list(x=x,y=y)
mytrain <-   pamr.train(mydata)
new.scales <- pamr.adaptthresh(mytrain)

 
mytrain2 <- pamr.train(mydata, threshold.scale=new.scales)

myresults2 <- pamr.cv(mytrain2, mydata)




