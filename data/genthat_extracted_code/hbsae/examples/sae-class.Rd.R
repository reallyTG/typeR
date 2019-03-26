library(hbsae)


### Name: sae-class
### Title: S3 class for the fitted model and SAE outcomes.
### Aliases: cAIC coef.sae COR COV CV EST fitted.sae MSE R2 raneff
###   raneff.se relSE residuals.sae sae-class SE se2 sv2 synthetic vcov.sae
###   wDirect

### ** Examples

d <- generateFakeData()

# compute small area estimates
sae <- fSAE(y0 ~ x + area2, data=d$sam, area="area", popdata=d$Xpop)

coef(sae)  # fixed effects
raneff(sae)  # random effects
sv2(sae)  # between-area variance
se2(sae)  # within-area variance
cAIC(sae)  # conditional AIC



