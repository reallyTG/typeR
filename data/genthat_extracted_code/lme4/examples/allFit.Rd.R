library(lme4)


### Name: allFit
### Title: Refit a fitted model with all available optimizers
### Aliases: allFit
### Keywords: models

### ** Examples

library(lme4)
gm1 <- glmer(cbind(incidence, size - incidence) ~ period + (1 | herd),
             data = cbpp, family = binomial)
## show available methods
allFit(show.meth.tab=TRUE) 
gm_all <- allFit(gm1)
ss <- summary(gm_all)
ss$fixef               ## extract fixed effects
ss$llik                ## log-likelihoods
ss$sdcor               ## SDs and correlations
ss$theta               ## Cholesky factors
ss$which.OK            ## which fits worked



