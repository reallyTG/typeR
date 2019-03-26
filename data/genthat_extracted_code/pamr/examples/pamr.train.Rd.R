library(pamr)


### Name: pamr.train
### Title: A function to train a nearest shrunken centroid classifier
### Aliases: pamr.train

### ** Examples

#generate some data
set.seed(120)
x <- matrix(rnorm(1000*20),ncol=20)
y <- sample(c(1:4),size=20,replace=TRUE)
mydata <- list(x=x,y=factor(y))

#train classifier
results<-   pamr.train(mydata)

# train classifier on all  data except class 4
results2 <- pamr.train(mydata,sample.subset=(mydata$y!=4))
 
# train classifier on  only the first 500 genes
results3 <- pamr.train(mydata,gene.subset=1:500)




