library(Rlinsolve)


### Name: lsolve.ssor
### Title: Symmetric Successive Over-Relaxation method
### Aliases: lsolve.ssor

### ** Examples

## Overdetermined System
A = matrix(rnorm(10*5),nrow=10)
x = rnorm(5)
b = A%*%x

out1 = lsolve.ssor(A,b)
out2 = lsolve.ssor(A,b,w=0.5)
out3 = lsolve.ssor(A,b,w=1.5)
matout = cbind(matrix(x),out1$x, out2$x, out3$x);
colnames(matout) = c("true x","SSOR w=1", "SSOR w=0.5", "SSOR w=1.5")
print(matout)




