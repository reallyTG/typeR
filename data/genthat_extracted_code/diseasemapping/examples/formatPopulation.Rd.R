library(diseasemapping)


### Name: formatPopulation-methods
### Title: Format a population data set
### Aliases: formatPopulation formatPopulation-methods
###   formatPopulation,data.frame-method
###   formatPopulation,SpatialPolygonsDataFrame-method
###   formatPopulation,list-method

### ** Examples

data('kentucky')
head(kentucky@data)
poptry <- formatPopulation(kentucky, breaks = c(seq(0, 80, by=10), Inf))
head(poptry)
poptryagg <- formatPopulation(kentucky, breaks = c(seq(0, 80, by=10), Inf), 
  aggregate.by=c("sex", "age"))
head(poptryagg)



