library(BSSasymp)


### Name: CRB
### Title: Cramer-Rao bound for the unmixing matrix estimate in the
###   independent component model.
### Aliases: CRB
### Keywords: multivariate

### ** Examples

# source components have t(9)- and Gaussian distribution  

f1<-function(x)
{
 gamma(5)*(1+(x*sqrt(9/7))^2/9)^(-5)/
 (sqrt(9*pi/(9/7))*gamma(9/2))
}

f2<-function(x)
{
 exp(-(x)^2/2)/sqrt(2*pi)
}

CRB(sdf=c(f1,f2))




