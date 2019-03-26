library(spduration)


### Name: accessors
### Title: Accessor methods for spdur Objects
### Aliases: accessors logLik.spdur nobs.spdur coef.spdur vcov.spdur
###   model.matrix.spdur terms.spdur

### ** Examples

data(model.coups)

logLik(model.coups)

nobs(model.coups)

coef(model.coups)

vcov(model.coups)

head(model.matrix(model.coups))

terms(model.coups)




