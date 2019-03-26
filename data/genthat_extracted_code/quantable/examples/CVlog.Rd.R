library(quantable)


### Name: CVlog
### Title: geometric coefficient of variation (CV for log transformed data)
###   Typically used to create and violin plot
### Aliases: CVlog

### ** Examples

dat <- matrix(rnorm(1000,10,5), ncol=20)
dim(dat)
cv <- CVlog(dat, top=5)
length(cv)
stopifnot(length(cv) == 45)
hist(cv)



