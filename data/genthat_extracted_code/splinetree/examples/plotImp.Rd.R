library(splinetree)


### Name: plotImp
### Title: Create a barplot of relative variable importance scores.
### Aliases: plotImp

### ** Examples

imp <- varImpCoeff(forest)[,3]
plotImp(imp, main="Standardized Variable Importance")



