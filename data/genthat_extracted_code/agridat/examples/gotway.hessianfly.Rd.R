library(agridat)


### Name: gotway.hessianfly
### Title: Hessian fly damage to wheat varieties
### Aliases: gotway.hessianfly
### Keywords: datasets

### ** Examples


## FIXME Could the spaMM package be useful here...????

data(gotway.hessianfly)
dat <- gotway.hessianfly

dat$prop <- dat$y / dat$n
if(require(desplot)){
  desplot(prop~long*lat, dat,
          aspect=1, # true aspect
          out1=block, text=gen, cex=1, shorten='no',
          main="gotway.hessianfly")
}

# ----------------------------------------------------------------------------

# Block random.  See Glimmix manual, output 1.18.
# Note: (Different parameterization)
## Not run: 
##D   ## require(lme4)
##D   ## l2 <- glmer(cbind(y, n-y) ~ gen + (1|block), data=dat, family=binomial,
##D   ##    control=glmerControl(check.nlev.gtr.1="ignore"))
##D   ## coef(l2)
## End(Not run)

# ----------------------------------------------------------------------------

## Not run: 
##D   # asreml3
##D   require(asreml)
##D   a2 <- asreml(prop ~ gen, data=dat, random=~block,
##D                family=asreml.binomial(),
##D                weights=n)
##D   coef(a2)
## End(Not run)

# ----------------------------------------------------------------------------

## Not run: 
##D   ## require(asreml4)
##D   ## a2 <- asreml(prop ~ gen, data=dat, random=~block,
##D   ##              family=asr_binomial(),
##D   ##              weights=n)
##D   ## coef(a2)
## End(Not run)




