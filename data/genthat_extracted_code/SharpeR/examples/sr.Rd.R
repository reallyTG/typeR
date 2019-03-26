library(SharpeR)


### Name: sr
### Title: Create an 'sr' object.
### Aliases: sr
### Keywords: univar

### ** Examples

# roll your own.
ope <- 253
zeta <- 1.0
n <- 3 * ope
rvs <- rsr(1,n,zeta,ope=ope)
roll.own <- sr(sr=rvs,df=n-1,ope=ope,rescal=sqrt(1/n))
# put a bunch in. naming becomes a problem.
rvs <- rsr(5,n,zeta,ope=ope)
roll.own <- sr(sr=rvs,df=n-1,ope=ope,rescal=sqrt(1/n))




