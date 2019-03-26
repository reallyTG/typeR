library(systemicrisk)


### Name: findFeasibleMatrix
### Title: Finds a Nonnegative Matrix Satisfying Row and Column Sums
### Aliases: findFeasibleMatrix

### ** Examples

p=matrix(c(1,0,0,1),nrow=2)
findFeasibleMatrix(c(1,1),c(1,1),p=p)

n <- 4
M <- matrix(nrow=n,ncol=n,rexp(n*n)*(runif(n*n)>0.6))
M
r <- rowSums(M)
c <- colSums(M)
Mnew <- findFeasibleMatrix(r=r,c=c,p=(M>0)*0.5)
Mnew
rowSums(M);rowSums(Mnew)
colSums(M);colSums(Mnew)



