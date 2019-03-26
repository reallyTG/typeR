library(quantable)


### Name: CV
### Title: compute CV for each row in matrix
### Aliases: CV

### ** Examples

dat <- matrix(rnorm(1000,10,5), ncol=20)
dim(dat)
cv <- CV(dat, top=5)
length(cv)
stopifnot(length(cv) == 45)
hist(cv)




