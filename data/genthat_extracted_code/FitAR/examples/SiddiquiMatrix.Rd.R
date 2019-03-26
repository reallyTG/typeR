library(FitAR)


### Name: SiddiquiMatrix
### Title: Covariance Matrix of MLE Parameters in an AR(p)
### Aliases: SiddiquiMatrix
### Keywords: ts

### ** Examples

#compute the inverse directly and by Siddiqui's method and compare:
phi<-PacfToAR(rep(0.8,5))
A<-SiddiquiMatrix(phi)
B<-solve(toeplitz(TacvfAR(phi, lag.max=length(phi)-1)))
max(abs(A-B))




