library(sarima)


### Name: ArmaModel-class
### Title: Classes ArmaModel, ArModel and MaModel in package sarima
### Aliases: ArmaModel-class ArModel-class MaModel-class
### Keywords: classes ts

### ** Examples

arma1p1 <- new("ArmaModel", ar = 0.5, ma = 0.9, sigma2 = 1)
autocovariances(arma1p1, maxlag = 10)
autocorrelations(arma1p1, maxlag = 10)
partialAutocorrelations(arma1p1, maxlag = 10)
partialAutocovariances(arma1p1, maxlag = 10)

new("ArmaModel", ar = 0.5, ma = 0.9, intercept = 4)
new("ArmaModel", ar = 0.5, ma = 0.9, center = 1.23)

new("ArModel", ar = 0.5,  center = 1.23)
new("MaModel", ma = 0.9,  center = 1.23)

# argument 'mean' is an alias for 'center':
new("ArmaModel", ar = 0.5, ma = 0.9, mean = 1.23)

##  both center and intercept may be given
## (the mean is not equal to the intercept in this case)
new("ArmaModel", ar = 0.5, ma = 0.9, center = 1.23, intercept = 2)

## Don't use 'mean' together with 'center' and/or 'intercept'.
##    new("ArmaModel", ar = 0.5, ma = 0.9, center = 1.23, mean  = 4)
##    new("ArmaModel", ar = 0.5, ma = 0.9, intercept = 2, mean  = 4)
## Both give error message:
##   Use argument 'mean' only when 'center' and 'intercept' are missing or zero



