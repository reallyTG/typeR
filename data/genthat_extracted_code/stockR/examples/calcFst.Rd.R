library(stockR)


### Name: calcFst
### Title: Calculate Fst statistics for frequency data
### Aliases: calcFst
### Keywords: misc

### ** Examples

set.seed(717)
data <- sim.stock.data( nAnimals=50, nSNPs=500, nSampleGrps=50, K=5, ninform=50)
calcFst( data, attributes( data)$grps)



