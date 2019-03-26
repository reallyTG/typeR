library(umx)


### Name: tmx_is.identified
### Title: Test if a factor model is identified
### Aliases: tmx_is.identified

### ** Examples

tmx_is.identified(nVariables = 2, nFactors = 1) # FALSE
tmx_is.identified(nVariables = 3, nFactors = 1) # TRUE
tmx_is.identified(nVariables = 4, nFactors = 2) # FALSE
tmx_is.identified(nVariables = 5, nFactors = 2) # TRUE



