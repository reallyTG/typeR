library(afex)


### Name: all_fit
### Title: Refit 'lmer' model using multiple optimizers
### Aliases: all_fit nmkbw

### ** Examples


## Not run: 
##D 
##D # basic usage
##D require(optimx)
##D gm1 <- glmer(cbind(incidence, size - incidence) ~ period + (1 | herd),
##D              data = cbpp, family = binomial)
##D gm_all <- all_fit(gm1)
##D t(sapply(gm_all,fixef)) ## extract fixed effects
##D sapply(gm_all,logLik) ## log-likelihoods
##D sapply(gm_all,getME,"theta") ## theta parameters
##D !sapply(gm_all,inherits,"try-error") ## was fit OK?
##D 
##D 
##D ## for GLMMs:
##D require("mlmRev") # for data
##D gm1 <- mixed(use ~ age*urban + (1 | district), family = binomial, 
##D              data = Contraception, method = "LRT")
##D gm_all <- all_fit(gm1$full_model)
##D sapply(gm_all,logLik)
##D 
##D ## use allFit in combination with expand.re = TRUE
##D data("sk2011.2") # see example("mixed")
##D sk2_aff <- droplevels(sk2011.2[sk2011.2$what == "affirmation",])
##D sk_m2 <- mixed(response ~ instruction*inference*type+(inference*type||id), sk2_aff,
##D                expand_re = TRUE)
##D sk_m2
##D sk_m2_allFit <- all_fit(sk_m2$full_model)
##D sk_m2_allFit # all fits fail
##D 
##D sk_m2_allFit <- all_fit(sk_m2$full_model, data = sk_m2$data) # works
##D t(sapply(sk_m2_allFit,fixef))
##D sapply(sk_m2_allFit,logLik)
##D 
## End(Not run)



