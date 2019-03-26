library(SpatialEpi)


### Name: besag_newell
### Title: Besag-Newell Cluster Detection Method
### Aliases: besag_newell
### Keywords: file

### ** Examples

## Load Pennsylvania Lung Cancer Data
data(pennLC)
data <- pennLC$data

## Process geographical information and convert to grid
geo <- pennLC$geo[,2:3]
geo <- latlong2grid(geo)

## Get aggregated counts of population and cases for each county
population <- tapply(data$population,data$county,sum)
cases <- tapply(data$cases,data$county,sum)

## Based on the 16 strata levels, computed expected numbers of disease
n.strata <- 16
expected.cases <- expected(data$population, data$cases, n.strata)

## Set Parameters
k <- 1250
alpha.level <- 0.05

# not controlling for stratas
results <- besag_newell(geo, population, cases, expected.cases=NULL, k, 
  alpha.level)

# controlling for stratas
results <- besag_newell(geo, population, cases, expected.cases, k, alpha.level)



