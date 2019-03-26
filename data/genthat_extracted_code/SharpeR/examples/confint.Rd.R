library(SharpeR)


### Name: confint.sr
### Title: Confidence Interval on (optimal) Signal-Noise Ratio
### Aliases: confint.sr confint.sropt confint.del_sropt
### Keywords: htest

### ** Examples


# using "sr" class:
ope <- 253
df <- ope * 6
xv <- rnorm(df, 1 / sqrt(ope))
mysr <- as.sr(xv,ope=ope)
confint(mysr,level=0.90)
# using "lm" class
yv <- xv + rnorm(length(xv))
amod <- lm(yv ~ xv)
mysr <- as.sr(amod,ope=ope)
confint(mysr,level.lo=0.05,level.hi=1.0)
# rolling your own.
ope <- 253
df <- ope * 6
zeta <- 1.0
rvs <- rsr(128, df, zeta, ope)
roll.own <- sr(sr=rvs,df=df,c0=0,ope=ope)
aci <- confint(roll.own,level=0.95)
coverage <- 1 - mean((zeta < aci[,1]) | (aci[,2] < zeta))
# using "sropt" class
ope <- 253
df1 <- 4
df2 <- ope * 3
rvs <- as.matrix(rnorm(df1*df2),ncol=df1)
sro <- as.sropt(rvs,ope=ope)
aci <- confint(sro)
# on sropt, rolling your own.
zeta.s <- 1.0
rvs <- rsropt(128, df1, df2, zeta.s, ope)
roll.own <- sropt(z.s=rvs,df1,df2,drag=0,ope=ope)
aci <- confint(roll.own,level=0.95)
coverage <- 1 - mean((zeta.s < aci[,1]) | (aci[,2] < zeta.s))
# using "del_sropt" class
nfac <- 5
nyr <- 10
ope <- 253
set.seed(as.integer(charToRaw("be determinstic")))
Returns <- matrix(rnorm(ope*nyr*nfac,mean=0,sd=0.0125),ncol=nfac)
# hedge out the first one:
G <- matrix(diag(nfac)[1,],nrow=1)
asro <- as.del_sropt(Returns,G,drag=0,ope=ope)
aci <- confint(asro,level=0.95)
# under the alternative
Returns <- matrix(rnorm(ope*nyr*nfac,mean=0.001,sd=0.0125),ncol=nfac)
asro <- as.del_sropt(Returns,G,drag=0,ope=ope)
aci <- confint(asro,level=0.95)




