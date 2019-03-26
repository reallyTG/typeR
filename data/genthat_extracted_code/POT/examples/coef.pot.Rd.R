library(POT)


### Name: coef.pot
### Title: Extract model coefficients of a "pot" model
### Aliases: coef.pot
### Keywords: models

### ** Examples

set.seed(123)
x <- rgpd(500, 0, 1, -0.15)
mle <- fitgpd(x, 0)
coef(mle)



