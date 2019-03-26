library(Rlinsolve)


### Name: lsolve.cg
### Title: Conjugate Gradient method
### Aliases: lsolve.cg

### ** Examples

## Overdetermined System
A = matrix(rnorm(10*5),nrow=10)
x = rnorm(5)
b = A%*%x

out1 = lsolve.sor(A,b,w=0.5)
out2 = lsolve.cg(A,b)
matout = cbind(matrix(x),out1$x, out2$x);
colnames(matout) = c("true x","SSOR result", "CG result")
print(matout)




