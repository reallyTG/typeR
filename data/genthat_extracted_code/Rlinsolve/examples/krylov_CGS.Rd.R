library(Rlinsolve)


### Name: lsolve.cgs
### Title: Conjugate Gradient Squared method
### Aliases: lsolve.cgs

### ** Examples

## Overdetermined System
A = matrix(rnorm(10*5),nrow=10)
x = rnorm(5)
b = A%*%x

out1 = lsolve.cg(A,b)
out2 = lsolve.cgs(A,b)
matout = cbind(matrix(x),out1$x, out2$x);
colnames(matout) = c("true x","CG result", "CGS result")
print(matout)




