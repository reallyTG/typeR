library(monomvn)


### Name: bmonomvn
### Title: Bayesian Estimation for Multivariate Normal Data with Monotone
###   Missingness
### Aliases: bmonomvn
### Keywords: multivariate regression optimize

### ** Examples

## standard usage, duplicating the results in
## Little and Rubin, section 7.4.3
data(cement.miss)
out <- bmonomvn(cement.miss)
out
out$mu
out$S

##
## A bigger example, comparing the various
## parsimonious methods
##

## generate N=100 samples from a 10-d random MVN
xmuS <- randmvn(100, 20)

## randomly impose monotone missingness
xmiss <- rmono(xmuS$x)

## using least squares only when necessary,
obl <- bmonomvn(xmiss)
obl

## look at the posterior variability
par(mfrow=c(1,2))
plot(obl)
plot(obl, "S")

## compare to maximum likelihood
Ellik.norm(obl$mu, obl$S, xmuS$mu, xmuS$S)
oml <- monomvn(xmiss, method="lasso")
Ellik.norm(oml$mu, oml$S, xmuS$mu, xmuS$S)


##
## a min-variance portfolio allocation example
##

## get the returns data, and use 20 random cols
data(returns)
train <- returns[,sample(1:ncol(returns), 20)]

## missingness pattern requires DA; also gather
## samples from the solution to a QP
obl.da <- bmonomvn(train, p=0, QP=TRUE)

## plot the QP weights distribution
plot(obl.da, "QP", xaxis="index")

## get ML solution: will warn about monotone violations
suppressWarnings(oml.da <- monomvn(train, method="lasso"))

## add mean and MLE comparison, requires the
## quadprog library for the solve.QP function
add.pe.QP(obl.da, oml.da)

## now consider adding in the market as a factor
data(market)
mtrain <- cbind(market, train)

## fit the model using only factor regressions
obl.daf <- bmonomvn(mtrain, method="factor", p=1, QP=1)
plot(obl.daf, "QP", xaxis="index", main="using only factors")
suppressWarnings(oml.daf <- monomvn(mtrain, method="factor"))
add.pe.QP(obl.daf, oml.daf)


##
## a Bayes/MLE comparison using least squares sparingly
##

## fit Bayesian and classical lasso
obls <- bmonomvn(xmiss, p=0.25)
Ellik.norm(obls$mu, obls$S, xmuS$mu, xmuS$S)
omls <- monomvn(xmiss, p=0.25, method="lasso")
Ellik.norm(omls$mu, omls$S, xmuS$mu, xmuS$S)

## compare to ridge regression
obrs <- bmonomvn(xmiss, p=0.25, method="ridge")
Ellik.norm(obrs$mu, obrs$S, xmuS$mu, xmuS$S)
omrs <- monomvn(xmiss, p=0.25, method="ridge")
Ellik.norm(omrs$mu, omrs$S, xmuS$mu, xmuS$S)

## using the maximum likelihood solution to initialize
## the Markov chain and avoid burn-in.  
ob2s <- bmonomvn(xmiss, p=0.25, B=0, start=omls, RJ="p")
Ellik.norm(ob2s$mu, ob2s$S, xmuS$mu, xmuS$S)



