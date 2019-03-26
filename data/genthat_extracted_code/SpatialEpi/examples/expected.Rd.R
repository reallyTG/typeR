library(SpatialEpi)


### Name: expected
### Title: Compute Expected Numbers of Disease
### Aliases: expected
### Keywords: file

### ** Examples

data(pennLC)
population <- pennLC$data$population
cases <- pennLC$data$cases

## In each county in Pennsylvania, there are 2 races, gender and 4 age bands 
## considered = 16 strata levels
pennLC$data[1:16,]
expected(population, cases, 16)



