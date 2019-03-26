library(semPLS)


### Name: sempls
### Title: Structural Equation Modeling by Partial Least Squares
### Aliases: sempls sempls.plsm print.sempls plot.sempls densityplot.sempls
###   pathCoeff pathCoeff.sempls print.pathCoeff totalEffects
###   totalEffects.sempls print.totalEffects plsWeights plsWeights.sempls
###   print.plsWeights plsLoadings plsLoadings.sempls print.plsLoadings

### ** Examples

data(ECSImobi)
ecsi <- sempls(model=ECSImobi, data=mobi, wscheme="pathWeighting")
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


### Create .dot representation of the path diagram and
### create .pdf file if graphviz is available.
## Not run: 
##D pathDiagram(ecsi, file="ecsiPLS1", edge.labels="both",
##D             output.type="graphics", digits=3, graphics.fmt = "pdf")
##D 
##D # include R-squared values
##D pathDiagram(ecsi, file="ecsiPLS2", edge.labels="both",
##D             output.type="graphics", digits=3, graphics.fmt = "pdf",
##D             rSquared=rSquared(ecsi))
##D 
##D # only the structural model
##D pathDiagram(ecsi, file="ecsiPLS3", edge.labels="both",
##D             output.type="graphics", digits=3, graphics.fmt = "pdf",
##D             rSquared=rSquared(ecsi), full=FALSE)
## End(Not run)



