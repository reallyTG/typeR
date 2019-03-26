library(Rlinsolve)


### Name: lsolve.gmres
### Title: Generalized Minimal Residual method
### Aliases: lsolve.gmres

### ** Examples

## Overdetermined System
A = matrix(rnorm(10*5),nrow=10)
x = rnorm(5)
b = A%*%x

out1 = lsolve.cg(A,b)
out3_1 = lsolve.gmres(A,b,restart=2)
out3_2 = lsolve.gmres(A,b,restart=3)
out3_3 = lsolve.gmres(A,b,restart=4)
matout = cbind(matrix(x),out1$x, out3_1$x, out3_2$x, out3_3$x);
colnames(matout) = c("true x","CG", "GMRES(2)", "GMRES(3)", "GMRES(4)")
print(matout)





