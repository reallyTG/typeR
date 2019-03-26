library(matlib)


### Name: plotEqn
### Title: Plot Linear Equations
### Aliases: plotEqn

### ** Examples

# consistent equations
A<- matrix(c(1,2,3, -1, 2, 1),3,2)
b <- c(2,1,3)
showEqn(A, b)
plotEqn(A,b)

# inconsistent equations
b <- c(2,1,6)
showEqn(A, b)
plotEqn(A,b)



