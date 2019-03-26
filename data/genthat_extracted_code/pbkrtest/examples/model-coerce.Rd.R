library(pbkrtest)


### Name: model-coerce
### Title: Conversion between a model object and a restriction matrix
### Aliases: model-coerce model2restrictionMatrix
###   model2restrictionMatrix.lm model2restrictionMatrix.mer
###   model2restrictionMatrix.merMod restrictionMatrix2model
###   restrictionMatrix2model.lm restrictionMatrix2model.mer
###   restrictionMatrix2model.merMod
### Keywords: utilities

### ** Examples


library(pbkrtest)
data("beets", package = "pbkrtest")
sug <- lm(sugpct ~ block + sow + harvest, data=beets)
sug.h <- update(sug, .~. - harvest)
sug.s <- update(sug, .~. - sow)

## Construct restriction matrices from models
L.h <- model2restrictionMatrix(sug, sug.h); L.h
L.s <- model2restrictionMatrix(sug, sug.s); L.s

## Construct submodels from restriction matrices
mod.h <- restrictionMatrix2model(sug, L.h); mod.h
mod.s <- restrictionMatrix2model(sug, L.s); mod.s

## The models have the same fitted values
plot(fitted(mod.h), fitted(sug.h))
plot(fitted(mod.s), fitted(sug.s))
## and the same log likelihood
logLik(mod.h)
logLik(sug.h)
logLik(mod.s)
logLik(sug.s)




