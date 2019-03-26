library(CISE)


### Name: MGRAF3
### Title: Third variant of M-GRAF model
### Aliases: MGRAF3

### ** Examples

data(A)
n = dim(A)[3]
subs = sample.int(n=n,size=30)
A_sub = A[ , , subs]
res = MGRAF3(A=A_sub, K=3, tol=0.01, maxit=5)




