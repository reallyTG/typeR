library(WeightedCluster)


### Name: wcAggregateCases
### Title: Aggregate identical cases.
### Aliases: wcAggregateCases wcAggregateCases.matrix
###   wcAggregateCases.data.frame print.wcAggregateCases

### ** Examples

data(mvad)
## Taking only the father unemployment and 
## success at the end of compulsory schooling.
myData <- mvad[ , c("funemp", "gcse5eq")]
## Computing aggregated cases informations
ac <- wcAggregateCases(myData, weights=mvad$weight)
print(ac)
## Retrieving unique cases in the original data set
uniqueData <- myData[ac$aggIndex, ]
## Table from original data
table.orig <- xtabs(mvad$weight~funemp+gcse5eq, data=myData)

## Table from aggregated data
table.agg <- xtabs(ac$aggWeights~funemp+gcse5eq, data=uniqueData)

## Both table are equal, no information is lost 
## (only the call command is different)
all(table.orig == table.agg)




