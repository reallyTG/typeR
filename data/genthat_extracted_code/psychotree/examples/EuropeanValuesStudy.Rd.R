library(psychotree)


### Name: EuropeanValuesStudy
### Title: European Values Study
### Aliases: EuropeanValuesStudy
### Keywords: datasets

### ** Examples

## data
data("EuropeanValuesStudy", package = "psychotree")
summary(EuropeanValuesStudy$paircomp)

## Not run: 
##D ## Bradley-Terry tree resulting in similar results compared to
##D ## the (different) tree approach of Lee and Lee (2010)
##D evs <- na.omit(EuropeanValuesStudy)
##D bt <- bttree(paircomp ~ gender + eduage + birthyear + marital + employment + income + country2,
##D   data = evs, alpha = 0.01)
##D plot(bt, abbreviate = 2)
## End(Not run)



