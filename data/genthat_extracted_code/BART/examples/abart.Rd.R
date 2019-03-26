library(BART)


### Name: abart
### Title: AFT BART for time-to-event outcomes
### Aliases: abart mc.abart
### Keywords: nonparametric tree regression nonlinear

### ** Examples


N = 1000
P = 5       #number of covariates
M = 8

set.seed(12)
x.train=matrix(runif(N*P, -2, 2), N, P)
mu = x.train[ , 1]^3
y=rnorm(N, mu)
offset=mean(y)
T=exp(y)
C=rexp(N, 0.05)
delta=(T<C)*1
table(delta)/N
times=(T*delta+C*(1-delta))

##test BART with token run to ensure installation works
set.seed(99)
post1 = abart(x.train, times, delta, nskip=5, ndpost=10)

## Not run: 
##D 
##D post1 = mc.abart(x.train, times, delta,
##D                  mc.cores=M, seed=99)
##D post2 = mc.abart(x.train, times, delta, offset=offset,
##D                  mc.cores=M, seed=99)
##D 
##D Z=8
##D 
##D plot(mu, post1$yhat.train.mean, asp=1,
##D      xlim=c(-Z, Z), ylim=c(-Z, Z))
##D abline(a=0, b=1)
##D 
##D plot(mu, post2$yhat.train.mean, asp=1,
##D      xlim=c(-Z, Z), ylim=c(-Z, Z))
##D abline(a=0, b=1)
##D 
##D plot(post1$yhat.train.mean, post2$yhat.train.mean, asp=1,
##D      xlim=c(-Z, Z), ylim=c(-Z, Z))
##D abline(a=0, b=1)
##D 
## End(Not run)




