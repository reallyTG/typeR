library(rje)


### Name: subtable
### Title: Subset an array
### Aliases: subarray subarray<- subtable subtable<-
### Keywords: array

### ** Examples

x = array(1:8, rep(2,3))
subarray(x, c(2,1,2)) == x[2,1,2]

x[2,1:2,2,drop=FALSE]
subarray(x, list(2,1:2,2), drop=FALSE)

subtable(x, c(2,3), list(1, 1:2))



