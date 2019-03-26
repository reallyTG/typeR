library(float)


### Name: matmult
### Title: matmult
### Aliases: matmult %*%,float32,float32-method %*%,float32,matrix-method
###   %*%,matrix,float32-method

### ** Examples

library(float)

s1 = flrunif(5, 5)
s2 = flrunif(5, 2)
x = matrix(1:25, 5)

s1 %*% s2 # float

storage.mode(x) # integer
x %*% s2 # float

storage.mode(x) = "double"
x %*% s2 # double




