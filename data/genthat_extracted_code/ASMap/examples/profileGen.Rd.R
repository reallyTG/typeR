library(ASMap)


### Name: profileGen
### Title: Profile individual genotype statistics for an R/qtl cross object
### Aliases: profileGen
### Keywords: misc

### ** Examples


data(mapDH, package = "ASMap")

## profile all genotype crossover and double crossover statistics

profileGen(mapDH, bychr = FALSE, stat.type = c("xo","dxo"),
     xo.lambda = 25, layout = c(1,3))




