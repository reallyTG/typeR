library(KRIS)


### Name: xxt
### Title: Calculate matrix multipication between a matrix and its
###   transpose for large data.
### Aliases: xxt

### ** Examples



#Use the example files embedded in the package.
X <-matrix(runif(100), ncol=20)
R1  <- xxt(X)

#Show the result (R1)
print(R1)
R2 <- X %*% t(X)

#Show the result (R2)
print(R2)






