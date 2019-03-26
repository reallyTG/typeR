library(matrixpls)


### Name: matrixpls.sempls
### Title: A semPLS compatibility wrapper for matrixpls
### Aliases: matrixpls.sempls

### ** Examples

if(!require(semPLS)){
    print("This example requires the semPLS package")
} else{
data(ECSImobi)

ecsi.sempls <- sempls(model=ECSImobi, data=mobi, wscheme="pathWeighting")
ecsi <- matrixpls.sempls(model=ECSImobi, data=mobi, wscheme="pathWeighting")

# If RUnit is installed check that the results are identical

if(require(RUnit)){
  checkEquals(ecsi.sempls,ecsi, check.attributes = FALSE)
}

ecsi

## create plots
densityplot(ecsi)
densityplot(ecsi, use="prediction")
densityplot(ecsi, use="residuals")

## Values of 'sempls' objects
names(ecsi)
ecsi$outer_weights
ecsi$outer_loadings
ecsi$path_coefficients
ecsi$total_effects


### using convenience methods to sempls results
## path coefficients
pathCoeff(ecsi)

## total effects
totalEffects(ecsi)

## get loadings and check for discriminant validity
(l <- plsLoadings(ecsi))
# outer loadings
print(l, type="outer", digits=2)
# outer loadings greater than 0.5
print(l,type="outer", cutoff=0.5, digits=2)
# cross loadings greater than 0.5
print(l, type="cross", cutoff=0.5, digits=2)


### R-squared
rSquared(ecsi)

}



