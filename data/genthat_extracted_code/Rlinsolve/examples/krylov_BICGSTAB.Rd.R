library(Rlinsolve)


### Name: lsolve.bicgstab
### Title: Biconjugate Gradient Stabilized Method
### Aliases: lsolve.bicgstab

### ** Examples

## Overdetermined System
A = matrix(rnorm(10*5),nrow=10)
x = rnorm(5)
b = A%*%x

out1 = lsolve.cg(A,b)
out2 = lsolve.bicg(A,b)
out3 = lsolve.bicgstab(A,b)
matout = cbind(matrix(x),out1$x, out2$x, out3$x);
colnames(matout) = c("true x","CG result", "BiCG result", "BiCGSTAB result")
print(matout)





