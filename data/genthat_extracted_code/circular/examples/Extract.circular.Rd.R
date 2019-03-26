library(circular)


### Name: [.circular
### Title: Extract or Replace Parts of a Circular Object
### Aliases: [.circular
### Keywords: array

### ** Examples

x <- circular(matrix(rwrappednormal(n=100, mu=circular(0)), nrow=5))
dim(x)
x[1,]
x[,1]
x[,1, drop=FALSE]



