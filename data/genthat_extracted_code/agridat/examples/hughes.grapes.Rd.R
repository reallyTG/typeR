library(agridat)


### Name: hughes.grapes
### Title: Disease incidence on grape leaves in RCB experiment
### Aliases: hughes.grapes

### ** Examples


data(hughes.grapes)
dat <- hughes.grapes

dat <- transform(dat, rate = diseased/total, plot=trt:block)

# Trt 1 has higher rate, more variable, Trt 3 lower rate, less variable
require(lattice)
foo <- bwplot(rate ~ vine|block*trt, dat, main="hughes.grapes",
              xlab="vine")
if(require(latticeExtra)){
  useOuterStrips(foo)
}

# Table 1 of Piepho 1999
tapply(dat$rate, dat$trt, mean) # trt 1 does not match Piepho
tapply(dat$rate, dat$trt, max)

# ----------------------------------------------------------------------------

## Not run: 
##D   # Piepho model 3.  Binomial data.  May not be exactly the same model
##D   
##D   # Use the binomial count data with lme4
##D   require(lme4)
##D   m1 <- glmer(cbind(diseased, total-diseased) ~ trt + block + (1|plot/vine),
##D               data=dat, family=binomial)
##D   m1
##D 
##D   # Switch from binomial counts to bernoulli data
##D   require(aod)
##D   bdat <- splitbin(cbind(diseased, total-diseased) ~ block+trt+plot+vine+shoot,
##D                    data=dat)$tab
##D   names(bdat)[2] <- 'y'
##D   
##D   # Using lme4
##D   m2 <- glmer(y ~ trt + block + (1|plot/vine), data=bdat, family=binomial)
##D   m2
##D   
##D   # Now using MASS:::glmmPQL
##D   require(MASS)
##D   m3 <- glmmPQL(y ~ trt + block, data=bdat,
##D                 random=~1|plot/vine, family=binomial)
##D   m3
## End(Not run)




