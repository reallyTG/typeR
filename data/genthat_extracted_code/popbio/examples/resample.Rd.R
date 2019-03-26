library(popbio)


### Name: resample
### Title: Resample a projection matrix
### Aliases: resample
### Keywords: survey

### ** Examples

data(hudsonia)
A<-hudsonia[[1]]
lambda(A)
## NOTE fertilities are in first two rows, so use r=1:2 for splitting this matrix
## resample transitions 100 times each
resample(A, 100, r=1:2)
## set higher fvar in stage 4 and 6 
##because there are two fertilities per stage (8 total), need to repeat values
resample(A,1000, fvar=c(1.5, 1.5, 3, 3), r=1:2)

## OR resample based on number of plants surveyed 
# data from table 6.4 and  box 7.3)
n<-c(4264,3, 30, 16, 24,5)
## create a list with 1000 resampled matrices
x<-lapply(1:1000, function(x) resample(A,n, r=1:2))
mean(x)
## use var2 to check variances, especially if  using differnt fvar values
var2(x)
## growth rates
y<-sapply(x, lambda)
quantile( y, c(0.025, .975) )

hist(y, br=30, col="palegreen", xlab="Lambda", main="1985 Hudsonia growth rates")
abline(v=quantile(y, c(0.025, .975)), lty=3)

## double the sample size (and quadruple seedlings) and you may be able to detect a decline
n<-n*2
n[2]<-n[2]*2
x<-lapply(1:1000, function(x) resample(A, n*2, r=1:2))
quantile( sapply(x, lambda), c(0.025, .975) )






