library(saeRobust)


### Name: fitrfh
### Title: Fitting Precedures
### Aliases: fitrfh fitrsfh fitrtfh fitrstfh fitGenericModel
###   rfh,numeric,matrixORMatrix,numeric,NULL-method
###   rfh,numeric,matrixORMatrix,numeric,corSAR1-method
###   rfh,numeric,matrixORMatrix,numeric,corAR1-method
###   rfh,numeric,matrixORMatrix,numeric,corSAR1AR1-method

### ** Examples

data(milk, package = "sae")
x <- matrix(1, nrow = NROW(milk))
y <- milk$yi
samplingVar <- milk$SD^2
fitrfh(y, x, samplingVar)



