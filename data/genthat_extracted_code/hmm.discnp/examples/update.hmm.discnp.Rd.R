library(hmm.discnp)


### Name: update.hmm.discnp
### Title: Update a fitted 'hmm.discnp' model.
### Aliases: update.hmm.discnp
### Keywords: methods models

### ** Examples

set.seed(294)
fit  <- hmm(WoodPeweeSong,K=2,rand.start=list(tpm=TRUE,Rho=TRUE),itmax=10)
xxx  <- rhmm(fit,nsim=1)
sfit <- update(fit,data=xxx,itmax=10)
yyy  <- with(SydColDisc,split(y,f=list(locn,depth)))
f1   <- hmm(yyy,K=1)
f2   <- update(f1,data=yyy,Kplus1=TRUE) # Big improvement, but ...
## Not run: 
##D g2   <- hmm(yyy,K=2) # Substantially better than f2. 
## End(Not run)



