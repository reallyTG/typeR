library(lava)


### Name: By
### Title: Apply a Function to a Data Frame Split by Factors
### Aliases: By

### ** Examples

By(datasets::CO2,~Treatment+Type,colMeans,~conc)
By(datasets::CO2,~Treatment+Type,colMeans,~conc+uptake)



