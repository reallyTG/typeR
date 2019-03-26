library(RandomFieldsUtils)


### Name: orderx
### Title: Ordering Permutation
### Aliases: orderx
### Keywords: univar manip

### ** Examples

x <- runif(10^6)
k <- 10
system.time(y<-order(x)[1:k])
system.time(z<-orderx(x, from=1, to=k)) ## much faster
stopifnot(all(x[y ]== x[z])) ## same result



