library(TruncatedNormal)


### Name: mvNcdf
### Title: truncated multivariate normal cumulative distribution
### Aliases: mvNcdf
### Keywords: truncated normal gaussian cumulative

### ** Examples

d=15;l=1:d;u=l+Inf;
Sig=matrix(rnorm(d^2),d,d)*2;Sig=Sig%*%t(Sig)
n=10^3 # size of simulation effort
x=mvNcdf(l,u,Sig,10^4) # compute the probability 
print(x)



