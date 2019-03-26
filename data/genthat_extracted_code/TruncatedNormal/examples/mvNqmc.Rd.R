library(TruncatedNormal)


### Name: mvNqmc
### Title: truncated multivariate normal cumulative distribution
###   (quasi-Monte Carlo)
### Aliases: mvNqmc
### Keywords: truncated normal gaussian cumulative quasi-Monte Carlo

### ** Examples

d=15;l=1:d;u=l+Inf;
Sig=matrix(rnorm(d^2),d,d)*2;Sig=Sig%*%t(Sig)
n=10^3 # size of simulation effort
x=mvNqmc(l,u,Sig,10^4)
print(x)



