library(pscl)


### Name: predict.hurdle
### Title: Methods for hurdle Objects
### Aliases: predict.hurdle residuals.hurdle terms.hurdle
###   model.matrix.hurdle coef.hurdle vcov.hurdle summary.hurdle
###   print.summary.hurdle logLik.hurdle fitted.hurdle predprob.hurdle
###   extractAIC.hurdle
### Keywords: regression

### ** Examples

data("bioChemists", package = "pscl")
fm <- hurdle(art ~ ., data = bioChemists)

plot(residuals(fm) ~ fitted(fm))

coef(fm)
coef(fm, model = "zero")

summary(fm)
logLik(fm)



