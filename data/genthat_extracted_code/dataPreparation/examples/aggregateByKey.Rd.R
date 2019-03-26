library(dataPreparation)


### Name: aggregateByKey
### Title: Automatic dataSet aggregation by key
### Aliases: aggregateByKey

### ** Examples

# Get generic dataset from R
data("adult")

# Aggregate it using aggregateByKey, in order to extract characteristics for each country
adult_aggregated <- aggregateByKey(adult, key = 'country')

# Exmple with other functions
power <- function(x){sum(x^2)}
adult_aggregated <- aggregateByKey(adult, key = 'country', functions = c("power", "sqrt"))

# sqrt is not an aggregation function, so it wasn't used.



