library(Rlinsolve)


### Name: lsolve.cheby
### Title: Chebyshev Method
### Aliases: lsolve.cheby

### ** Examples

## Overdetermined System
A = matrix(rnorm(10*5),nrow=10)
x = rnorm(5)
b = A%*%x

out1 = lsolve.sor(A,b,w=0.5)
out2 = lsolve.cheby(A,b)
matout = cbind(x, out1$x, out2$x);
colnames(matout) = c("original x","SOR result", "Chebyshev result")
print(matout)




