library(rangeBuilder)


### Name: filterByLand
### Title: Filter occurrences based on land vs ocean
### Aliases: filterByLand

### ** Examples

data(crotalus)

#identify points that fall off land
filterByLand(crotalus[,c('decimallongitude','decimallatitude')])



