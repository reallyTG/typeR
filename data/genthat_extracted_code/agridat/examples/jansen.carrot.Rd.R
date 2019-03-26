library(agridat)


### Name: jansen.carrot
### Title: Infestation of carrots by fly larvae
### Aliases: jansen.carrot
### Keywords: datasets

### ** Examples

data(jansen.carrot)
dat <- jansen.carrot

require(lattice)
dotplot(gen ~ y/n, data=dat, group=trt, auto.key=TRUE,
        main="jansen.carrot",
        xlab="Proportion of carrots infected per block", ylab="Genotype")

## Not run: 
##D   # Not run because CRAN wants < 5 seconds per example.  This is close.
##D   require(lme4)
##D   # Tentative model.  Needs improvement.
##D   m1 <- glmer(cbind(y,n-y) ~ gen*trt + (1|block),
##D               data=dat, family=binomial)
##D   summary(m1)
##D   # Todo: Why are these results different from Jansen?
##D   # Maybe he used ungrouped bernoulli data?  Too slow with 4700 obs  
## End(Not run)




