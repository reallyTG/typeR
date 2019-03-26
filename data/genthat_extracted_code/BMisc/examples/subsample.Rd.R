library(BMisc)


### Name: subsample
### Title: subsample
### Aliases: subsample

### ** Examples

data(LaborSupply, package="plm")
nrow(LaborSupply)
unique(LaborSupply$year)
ss <- subsample(LaborSupply, "id", "year", nkeep=100)
nrow(ss)




