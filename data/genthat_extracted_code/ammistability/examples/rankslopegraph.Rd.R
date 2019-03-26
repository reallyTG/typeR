library(ammistability)


### Name: rankslopegraph
### Title: Rank Slopegraph
### Aliases: rankslopegraph

### ** Examples

library(agricolae)
data(soil)

dec <- c("pH", "EC")
inc <- c("CaCO3", "MO", "CIC", "P", "K", "sand",
         "slime", "clay", "Ca", "Mg", "K2", "Na", "Al_H", "K_Mg", "Ca_Mg",
         "B", "Cu", "Fe", "Mn", "Zn")

soilrank <- rankdf(soil, increasing = inc, decreasing = dec)
soilrank
soilslopeg <- rankslopegraph(soilrank, names = "place")
soilslopeg



