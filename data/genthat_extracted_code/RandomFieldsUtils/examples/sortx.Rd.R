library(RandomFieldsUtils)


### Name: sortx
### Title: Sorting Vectors
### Aliases: sortx
### Keywords: univar manip

### ** Examples

x <- runif(10^6)
k <- 10
system.time(y<-sort(x)[1:k])
system.time(z<-sortx(x, from=1, to=k)) ## much faster
stopifnot(all(y == z)) ## same result



