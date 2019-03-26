library(geometry)


### Name: entry.value
### Title: Retrieve or set a list of array element values
### Aliases: entry.value entry.value<-
### Keywords: arith array math

### ** Examples

a = array(1:(4^4),c(4,4,4,4))
entry.value(a,cbind(1:4,1:4,1:4,1:4))
entry.value(a,cbind(1:4,1:4,1:4,1:4)) <- 0

entry.value(a, as.matrix(expand.grid(1:4,1:4,1:4,1:4)))
     # same as `c(a[1:4,1:4,1:4,1:4])' which is same as `c(a)'



