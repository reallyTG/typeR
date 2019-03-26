library(pscl)


### Name: predict.zeroinfl
### Title: Methods for zeroinfl Objects
### Aliases: predict.zeroinfl residuals.zeroinfl terms.zeroinfl
###   model.matrix.zeroinfl coef.zeroinfl vcov.zeroinfl summary.zeroinfl
###   print.summary.zeroinfl logLik.zeroinfl fitted.zeroinfl
###   predprob.zeroinfl extractAIC.zeroinfl
### Keywords: regression

### ** Examples

data("bioChemists", package = "pscl")

fm_zip <- zeroinfl(art ~ ., data = bioChemists)
plot(residuals(fm_zip) ~ fitted(fm_zip))

coef(fm_zip)
coef(fm_zip, model = "count")

summary(fm_zip)
logLik(fm_zip)



