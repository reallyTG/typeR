library(brm)


### Name: brm
### Title: Fitting Binary Regression Models
### Aliases: brm

### ** Examples

set.seed(0)
n           = 100
alpha.true  = c(0,-1)
beta.true   = c(-0.5,1)
gamma.true  = c(0.1,-0.5)
params.true = list(alpha.true=alpha.true, beta.true=beta.true, 
     gamma.true=gamma.true)
v.1         = rep(1,n)       # intercept term
v.2         = runif(n,-2,2) 
v           = cbind(v.1,v.2)
pscore.true = exp(v %*% gamma.true) / (1+exp(v %*% gamma.true))
p0p1.true   = t(mapply(getProbScalarRR,v %*% alpha.true,v %*% beta.true)) 
x           = mapply(rbinom,rep(1,n),rep(1,n),pscore.true)  
pA.true       = p0p1.true[,1]
pA.true[x==1] = p0p1.true[x==1,2]
y = mapply(rbinom,rep(1,n),rep(1,n),pA.true)

fit.mle = brm(y,x,v,v,'RR','MLE',v,TRUE)
fit.drw = brm(y,x,v,v,'RR','DR',v,TRUE)
fit.dru = brm(y,x,v,v,'RR','DR',v,FALSE)

fit.mle2 = brm(y,x,~v.2, ~v.2, 'RR','MLE', ~v.2,TRUE) # same as fit.mle




