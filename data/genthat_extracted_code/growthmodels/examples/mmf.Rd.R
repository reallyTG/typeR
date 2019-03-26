library(growthmodels)


### Name: mmf
### Title: Morgan-Mercer-Flodin growth model
### Aliases: mmf mmf.inverse

### ** Examples

growth <- mmf(0:10, 10, 0.5, 4, 1)
# Calculate inverse function
time <- mmf.inverse(growth, 10, 0.5, 4, 1)



