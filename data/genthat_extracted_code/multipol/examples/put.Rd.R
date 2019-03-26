library(multipol)


### Name: put
### Title: Substitute a value for a variable
### Aliases: put
### Keywords: array

### ** Examples


a <- as.multipol(matrix(1:12,3,4))
put(a,1,pi)
put(a,2,pi)

b <- as.multipol(array(1:12,c(3,2,3)))

put(b,2,pi,TRUE)
put(b,2,pi,FALSE)



