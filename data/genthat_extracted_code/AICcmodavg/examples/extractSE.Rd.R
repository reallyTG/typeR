library(AICcmodavg)


### Name: extractSE
### Title: Extract SE of Fixed Effects of 'coxme', 'glmer', and 'lmekin'
###   Fit
### Aliases: extractSE extractSE.default extractSE.coxme extractSE.lmekin
###   extractSE.mer extractSE.merMod
### Keywords: models

### ** Examples

##modified example from ?glmer
## Not run: 
##D if(require(lme4)) {
##D ##create proportion of incidence
##D cbpp$prop <- cbpp$incidence/cbpp$size
##D gm1 <- glmer(prop ~ period + (1 | herd), family = binomial,
##D              weights = size, data = cbpp)
##D ##print summary
##D summary(gm1)
##D ##extract variance-covariance matrix of fixed effects
##D vcov(gm1)
##D ##extract SE's of fixed effects - no labels
##D sqrt(diag(vcov(gm1))) #no labels
##D extractSE(gm1)  #with labels
##D detach(package:lme4)
##D }
## End(Not run)



