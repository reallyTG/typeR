library(growthmodels)


### Name: monomolecular
### Title: Monomolecular growth model
### Aliases: monomolecular monomolecular.inverse

### ** Examples

growth <- monomolecular(0:10, 10, 0.5, 0.3)
# Calculate inverse function
time <- monomolecular.inverse(growth, 10, 0.5, 0.3)



