library(mixtox)


### Name: CEx
### Title: Effect Calculation for All Ninteen Curves
### Aliases: CEx
### Keywords: effect concentration inverse function

### ** Examples

## example 1
# calculate the responses of hormesis curves at the concentration of 0.1 and 0.02 mol/L
model <- hormesis$sgl$model
param <- hormesis$sgl$param
CEx(model, param, conc = c(0.1, 0.02)) 

## example 2
# calculate the effect caused by four heavy metals and four ionic liquids at the concentration of
# 0.00001 and 0.00002 mol/L on the MCF-7 cells
model <- cytotox$sgl$model
param <- cytotox$sgl$param
CEx(model, param, conc = c(0.00001, 0.00002)) 

## example 3
# calculate the response ranges
model <- hormesis$sgl$model
param <- hormesis$sgl$param
CEx(model, param, conc = c(0, 1e20))



