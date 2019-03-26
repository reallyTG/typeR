library(Rlinsolve)


### Name: lsolve.gs
### Title: Gauss-Seidel method
### Aliases: lsolve.gs

### ** Examples

## Overdetermined System
A = matrix(rnorm(10*5),nrow=10)
x = rnorm(5)
b = A%*%x

out = lsolve.gs(A,b)
matout = cbind(matrix(x),out$x); colnames(matout) = c("true x","est from GS")
print(matout)




