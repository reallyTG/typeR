library(zipfR)


### Name: lnre
### Title: LNRE Models (zipfR)
### Aliases: lnre lnre.object
### Keywords: distribution models

### ** Examples


## load Dickens dataset
data(Dickens.spc)

## estimate parameters of GIGP model and show summary
m <- lnre("gigp", Dickens.spc)
m
## Don't show: 
stopifnot( m$gof$X2 < 1000 ) # should achieve this goodness-of-fit
## End(Don't show)

## N, V and V1 of spectrum used to compute model
## (should be the same as for Dickens.spc)
N(m)
V(m)
Vm(m,1)
## Don't show: 
stopifnot( N(m) == N(Dickens.spc) ) 
stopifnot( V(m) == V(Dickens.spc) ) 
stopifnot( all(Vm(m,1:10) == Vm(Dickens.spc,1:10)) )
## End(Don't show)

## expected V and V_m and their variances for arbitrary N 
EV(m,100e6)
VV(m,100e6)
EVm(m,1,100e6)
VVm(m,1,100e6)

## use only 10 instead of 15 spectrum elements to estimate model
## (note how fit improves for V and V1)
m.10 <- lnre("gigp", Dickens.spc, m.max=10)
m.10

## experiment with different cost functions
m.mse <- lnre("gigp", Dickens.spc, cost="mse")
m.mse
m.exact <- lnre("gigp", Dickens.spc, cost="exact")
m.exact
## Don't show: 
stopifnot( abs(V(m.exact) - EV(m.exact, N(m.exact))) < .5 )
stopifnot( abs(Vm(m.exact, 1) - EVm(m.exact, 1, N(m.exact))) < .5 ) 
## End(Don't show)

## NLM minimization algorithm is faster but less robust
m.nlm <- lnre("gigp", Dickens.spc, method="NLM")
m.nlm

## ZM and fZM LNRE models have special estimation algorithms
m.zm <- lnre("zm", Dickens.spc)
m.zm
m.fzm <- lnre("fzm", Dickens.spc)
m.fzm
## Don't show: 
stopifnot( m.fzm$gof$X2 < 1500 ) # fit is not as good as for GIGP model
## End(Don't show)

## estimation is much faster if approximations are allowed
m.approx <- lnre("fzm", Dickens.spc, exact=FALSE)
m.approx
## Don't show: 
## differences between exact and approximate model shouldn't be too large
stopifnot( abs(m.fzm$param$alpha - m.approx$param$alpha) < .1 )
## End(Don't show)

## specify parameters of LNRE models directly
m <- lnre("zm", alpha=.5, B=.01)
lnre.spc(m, N=1000, m.max=10)

m <- lnre("fzm", alpha=.5, A=1e-6, B=.01)
lnre.spc(m, N=1000, m.max=10)

m <- lnre("gigp", gamma=-.5, B=.01, C=.01)
lnre.spc(m, N=1000, m.max=10)




