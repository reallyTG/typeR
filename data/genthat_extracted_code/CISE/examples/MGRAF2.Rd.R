library(CISE)


### Name: MGRAF2
### Title: Second variant of M-GRAF model
### Aliases: MGRAF2

### ** Examples

data(A)
n = dim(A)[3]
subs = sample.int(n=n,size=30)
A_sub = A[ , , subs]
res = MGRAF2(A=A_sub, K=3, tol=0.01, maxit=5)




