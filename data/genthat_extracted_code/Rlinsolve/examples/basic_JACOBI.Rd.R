library(Rlinsolve)


### Name: lsolve.jacobi
### Title: Jacobi method
### Aliases: lsolve.jacobi

### ** Examples

## Overdetermined System
A = matrix(rnorm(10*5),nrow=10)
x = rnorm(5)
b = A%*%x

out1 = lsolve.jacobi(A,b,weight=1,verbose=FALSE)   # unweighted
out2 = lsolve.jacobi(A,b,verbose=FALSE)            # weight of 0.66
out3 = lsolve.jacobi(A,b,weight=0.5,verbose=FALSE) # weight of 0.50
print("* lsolve.jacobi : overdetermined case example")
print(paste("*   error for unweighted    Jacobi case : ",norm(out1$x-x)))
print(paste("*   error for 0.66 weighted Jacobi case : ",norm(out2$x-x)))
print(paste("*   error for 0.50 weighted Jacobi case : ",norm(out3$x-x)))




