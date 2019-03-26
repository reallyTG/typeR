library(infoDecompuTE)


### Name: adjustEffectNames
### Title: Adjust the Effects' Names
### Aliases: adjustEffectNames

### ** Examples


str.for = "A*(B/E/C)*D"
effectsMatrix= attr(terms(as.formula(paste("~", str.for)), keep.order = TRUE) , "factors")
effectNames =  attr(terms(as.formula(paste("~", str.for)), keep.order = TRUE) , "term.labels")

adjustEffectNames(effectsMatrix, effectNames) 




