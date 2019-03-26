library(vegan)


### Name: predict.cca
### Title: Prediction Tools for [Constrained] Ordination (CCA, RDA, DCA,
###   CA, PCA)
### Aliases: fitted.cca fitted.rda fitted.capscale fitted.dbrda
###   residuals.cca predict.cca predict.rda predict.decorana coef.cca
###   coef.rda calibrate.cca calibrate
### Keywords: multivariate

### ** Examples

data(dune)
data(dune.env)
mod <- cca(dune ~ A1 + Management + Condition(Moisture), data=dune.env)
# Definition of the concepts 'fitted' and 'residuals'
mod
cca(fitted(mod))
cca(residuals(mod))
# Remove rare species (freq==1) from 'cca' and find their scores
# 'passively'.
freq <- specnumber(dune, MARGIN=2)
freq
mod <- cca(dune[, freq>1] ~ A1 + Management + Condition(Moisture), dune.env)
predict(mod, type="sp", newdata=dune[, freq==1], scaling="species")
# New sites
predict(mod, type="lc", new=data.frame(A1 = 3, Management="NM", Moisture="2"), scal=2)
# Calibration and residual plot
mod <- cca(dune ~ A1 + Moisture, dune.env)
pred <- calibrate(mod)
pred
with(dune.env, plot(A1, pred[,"A1"] - A1, ylab="Prediction Error"))
abline(h=0)



