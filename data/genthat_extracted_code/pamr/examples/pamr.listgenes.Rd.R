library(pamr)


### Name: pamr.listgenes
### Title: A function to list the genes that survive the thresholding, from
###   the nearest shrunken centroid classifier
### Aliases: pamr.listgenes

### ** Examples


#generate some data
set.seed(120)
x <- matrix(rnorm(1000*20),ncol=20)
y <- sample(c(1:4),size=20,replace=TRUE)

mydata <- list(x=x,y=factor(y), geneid=as.character(1:nrow(x)),
               genenames=paste("g",as.character(1:nrow(x)),sep=""))


#train classifier
mytrain<-   pamr.train(mydata)

pamr.listgenes(mytrain, mydata, threshold=1.6)
 



