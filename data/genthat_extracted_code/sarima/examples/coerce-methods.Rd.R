library(sarima)


### Name: coerce-methods
### Title: setAs methods in package sarima
### Aliases: coerce-methods setAs coerce,ANY,Autocorrelations-method
###   coerce,ANY,ComboAutocorrelations-method
###   coerce,ANY,ComboAutocovariances-method
###   coerce,ANY,PartialAutocorrelations-method
###   coerce,ANY,PartialAutocovariances-method
###   coerce,ANY,PartialVariances-method coerce,ArmaSpec,list-method
###   coerce,Autocorrelations,ComboAutocorrelations-method
###   coerce,Autocorrelations,ComboAutocovariances-method
###   coerce,Autocovariances,ComboAutocorrelations-method
###   coerce,Autocovariances,ComboAutocovariances-method
###   coerce,BJFilter,SPFilter-method coerce,numeric,BJFilter-method
###   coerce,numeric,SPFilter-method
###   coerce,PartialVariances,Autocorrelations-method
###   coerce,PartialVariances,Autocovariances-method
###   coerce,PartialVariances,ComboAutocorrelations-method
###   coerce,PartialVariances,ComboAutocovariances-method
###   coerce,SarimaFilter,ArmaFilter-method coerce,SarimaModel,list-method
###   coerce,SPFilter,BJFilter-method coerce,vector,Autocorrelations-method
###   coerce,vector,Autocovariances-method
###   coerce,vector,PartialAutocorrelations-method
###   coerce,vector,PartialAutocovariances-method
###   coerce,VirtualArmaFilter,list-method
###   coerce,VirtualSarimaModel,ArmaModel-method
### Keywords: methods

### ** Examples


## the default for ARMA model is BJ for ar and SP for ma:
mo <- new("ArmaModel", ar = 0.9, ma = 0.4, sigma2 = 1)
modelPoly(mo)

## here we declare explicitly that 0.4 uses the SP convention
##    (not necessary, the result is the same, but the intention is clear).
mo1 <- new("ArmaModel", ar = 0.9, ma = as(0.4, "SPFilter"), sigma2 = 1)
modelPoly(mo1)
identical(mo, mo1) ## TRUE

## if the sign of theta follows the BJ convention, this can be stated unambiguously.
##   This creates the same model:
mo2 <- new("ArmaModel", ar = 0.9, ma = as(-0.4, "BJFilter"), sigma2 = 1)
modelPoly(mo2)
identical(mo, mo2) ## TRUE

## And this gives the intended model whatever the default conventions:
ar3 <- as(0.9, "BJFilter")
ma3 <- as(-0.4, "BJFilter")
mo3 <- new("ArmaModel", ar = ar3, ma = ma3, sigma2 = 1)
modelPoly(mo3)
identical(mo, mo3) ## TRUE

## The coefficients can be extracted in any particular form,
## e.g. to pass them to functions with specific requirements:
modelCoef(mo3) # coefficients of the model with the default (BD) sign convention
modelCoef(mo3, convention = "BD") # same result
modelCoef(mo3, convention = "SP") # signal processing convention


## for ltsa::tacvfARMA() the convention is BJ, so:
co <- modelCoef(mo3, convention = "BJ") # Box-Jenkins convention

ltsa::tacvfARMA(co$ar, co$ma, maxLag = 6, sigma2 = 1)
autocovariances(mo3, maxlag = 6) ## same



