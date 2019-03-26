library(betareg)


### Name: summary.betareg
### Title: Methods for betareg Objects
### Aliases: print.betareg summary.betareg print.summary.betareg
###   coef.betareg vcov.betareg bread.betareg estfun.betareg
###   coeftest.betareg logLik.betareg terms.betareg model.frame.betareg
###   model.matrix.betareg cooks.distance.betareg hatvalues.betareg
### Keywords: regression

### ** Examples

options(digits = 4)

data("GasolineYield", package = "betareg")

gy2 <- betareg(yield ~ batch + temp | temp, data = GasolineYield)

summary(gy2)
coef(gy2)
vcov(gy2)
logLik(gy2)
AIC(gy2)

coef(gy2, model = "mean")
coef(gy2, model = "precision")
summary(gy2, phi = FALSE)



