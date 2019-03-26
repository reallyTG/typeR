library(merDeriv)


### Name: vcov.glmerMod
### Title: Extract Variance-Covariance Matrix of all Parameters for
###   Generalized Linear Mixed Effects Models
### Aliases: vcov.glmerMod

### ** Examples

## Not run: 
##D     # The cbpp example
##D     lme4fit <- glmer(cbind(incidence, size - incidence) ~ period + (1 | herd),
##D       data = cbpp, family = binomial)
##D 
##D     # variance covariance matrix for all parameters
##D     vcov(lme4fit, full = TRUE)
## End(Not run)



