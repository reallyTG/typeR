library(carx)


### Name: carxSelect
### Title: Select a 'carx' model by the AIC
### Aliases: carxSelect

### ** Examples

dataSim <- carxSimCenTS(nObs=100)
fmls <- list(M1=y~X1,M2=y~X1+X2,M3=y~X1+X2-1)
## Not run: cs = carxSelect(y~X1,max.ar=3,data=dataSim)
## Not run: cs = carxSelect(formulas=fmls,max.ar=3,data=dataSim)
## Not run: 
##D   #To compute confidence intervals for the selected model, call with CI.compute=TRUE.
##D   cs = carxSelect(formulas=fmls,max.ar=3,data=dataSim,CI.compute=TRUE)
## End(Not run)




