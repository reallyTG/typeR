library(BayesS5)


### Name: SSS
### Title: Shotgun stochastic search algorithm (SSS)
### Aliases: SSS
### Keywords: Shotgun Stochastic Search Bayesian variable selection g-prior
###   nonlocal prior piMoM peMoM

### ** Examples

p=100
n = 200

indx.beta = 1:5
xd0 = rep(0,p);xd0[indx.beta]=1
bt0 = rep(0,p); 
bt0[1:5]=c(1,1.25,1.5,1.75,2)*sample(c(1,-1),5,replace=TRUE)
xd=xd0
bt=bt0
X = matrix(rnorm(n*p),n,p)
y = crossprod(t(X),bt0) + rnorm(n)*sqrt(1.5)
X = scale(X)
y = y-mean(y)
y = as.vector(y)

### default setting
#fit_de_SSS = SSS(X,y)

#res_de_SSS = result(fit_de_SSS)
#print(res_de_SSS$hppm) # the MAP model 
#print(res_de_SSS$hppm.prob) # the posterior probability of the hppm 
#plot(res_de_SSS$marg.prob,ylim=c(0,1),ylab="marginal inclusion probability")
 # the marginal inclusion probability 



