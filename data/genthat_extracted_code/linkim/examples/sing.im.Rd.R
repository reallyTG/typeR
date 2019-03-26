library(linkim)


### Name: sing.im
### Title: Single imputation method
### Aliases: sing.im
### Keywords: sing.im

### ** Examples

set.seed(123)
data <- matrix(sample(x=c(0,1,2,3),size=48,replace=TRUE),,4)
data[c(5,6,12),2] <- NA
data[c(4,12),3] <- NA
data[c(5,6),4] <- NA
sing.im(data)
sing.im(data,index=TRUE)



