library(growthmodels)


### Name: vonBertalanffy
### Title: von Bertalanffy growth model
### Aliases: vonBertalanffy vonBertalanffy.inverse

### ** Examples

growth <- vonBertalanffy(0:10, 10, 0.5, 0.3, 0.5)
# Calculate inverse function
time <- vonBertalanffy.inverse(growth, 10, 0.5, 0.3, 0.5)



