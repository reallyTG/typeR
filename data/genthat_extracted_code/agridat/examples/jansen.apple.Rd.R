library(agridat)


### Name: jansen.apple
### Title: Infestation of apple shoots by apple canker.
### Aliases: jansen.apple
### Keywords: datasets

### ** Examples

data(jansen.apple)
dat <- jansen.apple

require(lattice)
xyplot(inoculum ~ y/n|gen, data=dat, group=block,
       layout=c(3,1),
       main="jansen.apple",
       xlab="Proportion infected per block/inoculum",
       ylab="Inoculum level")

## Not run: 
##D   require(lme4)
##D   # Tentative model.  Needs improvement.
##D   m1 <- glmer(cbind(y,n-y) ~ gen + factor(inoculum) + (1|block),
##D               data=dat, family=binomial)
##D   summary(m1)
## End(Not run)




