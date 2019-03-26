library(monomvn)


### Name: monomvn
### Title: Maximum Likelihood Estimation for Multivariate Normal Data with
###   Monotone Missingness
### Aliases: monomvn
### Keywords: multivariate regression

### ** Examples

## standard usage, duplicating the results in
## Little and Rubin, section 7.4.3 -- try adding 
## verb=3 argument for a step-by-step breakdown
data(cement.miss)
out <- monomvn(cement.miss)
out
out$mu
out$S

##
## A bigger example, comparing the various methods
##

## generate N=100 samples from a 10-d random MVN
xmuS <- randmvn(100, 20)

## randomly impose monotone missingness
xmiss <- rmono(xmuS$x)

## plsr
oplsr <- monomvn(xmiss, obs=TRUE)
oplsr
Ellik.norm(oplsr$mu, oplsr$S, xmuS$mu, xmuS$S)

## calculate the complete and observed RMSEs
n <- nrow(xmiss) - max(oplsr$na)
x.c <- xmiss[1:n,]
mu.c <- apply(x.c, 2, mean)
S.c <- cov(x.c)*(n-1)/n
Ellik.norm(mu.c, S.c, xmuS$mu, xmuS$S)
Ellik.norm(oplsr$mu.obs, oplsr$S.obs, xmuS$mu, xmuS$S)

## plcr
opcr <- monomvn(xmiss, method="pcr")
Ellik.norm(opcr$mu, opcr$S, xmuS$mu, xmuS$S)

## ridge regression
oridge <- monomvn(xmiss, method="ridge")
Ellik.norm(oridge$mu, oridge$S, xmuS$mu, xmuS$S)

## lasso
olasso <- monomvn(xmiss, method="lasso")
Ellik.norm(olasso$mu, olasso$S, xmuS$mu, xmuS$S)

## lar
olar <- monomvn(xmiss, method="lar")
Ellik.norm(olar$mu, olar$S, xmuS$mu, xmuS$S)

## forward.stagewise
ofs <- monomvn(xmiss, method="forward.stagewise")
Ellik.norm(ofs$mu, ofs$S, xmuS$mu, xmuS$S)

## stepwise
ostep <- monomvn(xmiss, method="stepwise")
Ellik.norm(ostep$mu, ostep$S, xmuS$mu, xmuS$S)



