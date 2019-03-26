library(pamr)


### Name: pamr.geneplot
### Title: A function to plot the genes that surive the thresholding from
###   the nearest shrunken centroid classifier
### Aliases: pamr.geneplot

### ** Examples

set.seed(120)
x <- matrix(rnorm(1000*20),ncol=20)
y <- sample(c(1:4),size=20,replace=TRUE)
mydata <- list(x=x,y=y)
mytrain <-   pamr.train(mydata)
pamr.geneplot(mytrain, mydata, threshold=1.6)
 



