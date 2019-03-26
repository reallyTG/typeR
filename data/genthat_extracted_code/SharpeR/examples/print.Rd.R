library(SharpeR)


### Name: print.sr
### Title: Print values.
### Aliases: print.sr print.sropt print.del_sropt

### ** Examples

# compute a 'daily' Sharpe
mysr <- as.sr(rnorm(253*8),ope=1,epoch="day")
print(mysr)
# roll your own.
ope <- 253
zeta <- 1.0
n <- 6 * ope
rvs <- rsr(1,n,zeta,ope=ope)
roll.own <- sr(sr=rvs,df=n-1,ope=ope,rescal=sqrt(1/n))
print(roll.own)
# put a bunch in. naming becomes a problem.
rvs <- rsr(5,n,zeta,ope=ope)
roll.own <- sr(sr=rvs,df=n-1,ope=ope,rescal=sqrt(1/n))
print(roll.own)
# for sropt objects:
nfac <- 5
nyr <- 10
ope <- 253
# simulations with no covariance structure.
# under the null:
set.seed(as.integer(charToRaw("be determinstic")))
Returns <- matrix(rnorm(ope*nyr*nfac,mean=0,sd=0.0125),ncol=nfac)
asro <- as.sropt(Returns,drag=0,ope=ope)
print(asro)



