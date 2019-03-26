library(Rlinsolve)


### Name: lsolve.bicg
### Title: Biconjugate Gradient method
### Aliases: lsolve.bicg

### ** Examples

## Overdetermined System
A = matrix(rnorm(10*5),nrow=10)
x = rnorm(5)
b = A%*%x

out1 = lsolve.cg(A,b)
out2 = lsolve.bicg(A,b)
matout = cbind(matrix(x),out1$x, out2$x);
colnames(matout) = c("true x","CG result", "BiCG result")
print(matout)




