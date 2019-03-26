library(svdvisual)


### Name: overallmean
### Title: Global mean matrix
### Aliases: overallmean
### Keywords: svd mean matrix

### ** Examples

#generate a random matrix
x<-matrix(rnorm(100), nrow=20);

#calculate the row mean matrix
y<-overallmean(x);
y



