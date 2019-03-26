library(DescTools)


### Name: Depreciation
### Title: Several Methods of Depreciation of an Asset
### Aliases: SLN SYD DB Depreciation

### ** Examples

# depreciation allowance for each year
SLN(cost = 50000, salvage = 10000, life = 5)
DB(cost = 50000, salvage = 10000, life = 5)

50000 - c(0, cumsum(SYD(cost = 50000, salvage = 10000, life = 5)))





