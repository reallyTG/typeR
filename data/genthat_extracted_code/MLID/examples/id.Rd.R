library(MLID)


### Name: id
### Title: (Multilevel) index of dissimilarity
### Aliases: id

### ** Examples

data(ethnicities)
head(ethnicities)
# Calculate the standard index value
id(ethnicities, vars = c("Bangladeshi", "WhiteBrit"))

## Not run: 
##D # Calculate also the expected value under randomisation
##D id(ethnicities, vars = c("Bangladeshi", "WhiteBrit"), expected = TRUE)
##D # will generate a warning because the total population per neighbourhood
##D # has not been specified
##D id(ethnicities, vars = c("Bangladeshi", "WhiteBrit", "Persons"),
##D expected = TRUE)
##D # The expected value is a high percentage of the actual value so
##D # aggregate it into a higher level geography...
##D aggdata <- sumup(ethnicities, sumby = "LSOA", drop = "OA")
##D head(aggdata)
##D 
##D # Multilevel models
##D id(aggdata, vars = c("Bangladeshi", "WhiteBrit"),
##D levels = c("MSOA","LAD","RGN"))
##D id(aggdata, vars = c("Bangladeshi", "WhiteBrit"),
##D levels = c("MSOA","LAD","RGN"), omit = c("Tower Hamlets", "Newham"))
## End(Not run)



