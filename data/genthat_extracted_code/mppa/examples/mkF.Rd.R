library(mppa)


### Name: mkF
### Title: Estimation of the cumulative intensity of a process using native
###   'density'
### Aliases: mkF

### ** Examples

start=0; end=1
A=rbeta(100, 1, 10)
B=rbeta(100, 1, 10)
##This will be extreme because A and B are not homogeneous over [0,1]
corrtest(A,B)
##If we use an estimate of F the p-value is less aggressive
corrtest(A,B,F=mkF(c(A,B), start=0, end=1))
##But we can still find evidence of A causing B:
Bc=c(B, sample(A, 10)+abs(rnorm(10, 0,.0001))); Bc = Bc[Bc>start&Bc<end]
corrtest(A,Bc,F=mkF(c(A,Bc), start=0, end=1))



