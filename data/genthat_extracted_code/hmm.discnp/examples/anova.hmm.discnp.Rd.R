library(hmm.discnp)


### Name: anova.hmm.discnp
### Title: Anova for hmm.discnp models
### Aliases: anova.hmm.discnp
### Keywords: models methods

### ** Examples

xxx  <- with(SydColDisc,split(y,f=list(locn,depth)))
fit1 <- hmm(xxx,K=1,itmax=10)
fit2 <- hmm(xxx,K=2,itmax=10)
anova(fit1,fit2)



