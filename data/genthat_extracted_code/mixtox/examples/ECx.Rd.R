library(mixtox)


### Name: ECx
### Title: Effect Concentration Calculation for Sigmoidal Models
### Aliases: ECx
### Keywords: effect concentration concentration-response curve

### ** Examples

## example 1
# calculate EC5 and EC50 of seven antibiotics on the photobacteria
model <- antibiotox$sgl$model
param <- antibiotox$sgl$param
effv <- c(0.05, 0.5)
ECx(model, param, effv = c(0.05, 0.50))

## example 2
# calculate EC5 and EC50 of four heavy metals and four ionic liquids on the MCF-7 cells
model <- cytotox$sgl$model
param <- cytotox$sgl$param
ECx(model, param, effv = c(0.05, 0.50), rtype = 'quantal')



