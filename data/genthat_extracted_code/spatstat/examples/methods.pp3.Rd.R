library(spatstat)


### Name: methods.pp3
### Title: Methods for three-dimensional point patterns
### Aliases: methods.pp3 print.pp3 summary.pp3 print.summary.pp3
###   unitname.pp3 unitname<-.pp3
### Keywords: spatial methods

### ** Examples

   X <- pp3(runif(42),runif(42),runif(42), box3(c(0,1), unitname="mm"))
   X
   unitname(X)
   unitname(X) <- c("foot", "feet")
   summary(X)



