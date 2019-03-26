library(SharpeR)


### Name: inference
### Title: Inference on noncentrality parameter of F-like statistic
### Aliases: inference inference.sropt inference.del_sropt
### Keywords: htest

### ** Examples

# generate some sropts
nfac <- 3
nyr <- 5
ope <- 253
# simulations with no covariance structure.
# under the null:
set.seed(as.integer(charToRaw("determinstic")))
Returns <- matrix(rnorm(ope*nyr*nfac,mean=0,sd=0.0125),ncol=nfac)
asro <- as.sropt(Returns,drag=0,ope=ope)
est1 <- inference(asro,type='unbiased')  
est2 <- inference(asro,type='KRS')  
est3 <- inference(asro,type='MLE')

# under the alternative:
Returns <- matrix(rnorm(ope*nyr*nfac,mean=0.0005,sd=0.0125),ncol=nfac)
asro <- as.sropt(Returns,drag=0,ope=ope)
est1 <- inference(asro,type='unbiased')  
est2 <- inference(asro,type='KRS')  
est3 <- inference(asro,type='MLE')

# sample many under the alternative, look at the estimator.
df1 <- 3
df2 <- 512
ope <- 253
zeta.s <- 1.25
rvs <- rsropt(128, df1, df2, zeta.s, ope)
roll.own <- sropt(z.s=rvs,df1,df2,drag=0,ope=ope)
est1 <- inference(roll.own,type='unbiased')  
est2 <- inference(roll.own,type='KRS')  
est3 <- inference(roll.own,type='MLE')

# for del_sropt:
nfac <- 5
nyr <- 10
ope <- 253
set.seed(as.integer(charToRaw("fix seed")))
Returns <- matrix(rnorm(ope*nyr*nfac,mean=0.0005,sd=0.0125),ncol=nfac)
# hedge out the first one:
G <- matrix(diag(nfac)[1,],nrow=1)
asro <- as.del_sropt(Returns,G,drag=0,ope=ope)
est1 <- inference(asro,type='unbiased')  
est2 <- inference(asro,type='KRS')  
est3 <- inference(asro,type='MLE')




