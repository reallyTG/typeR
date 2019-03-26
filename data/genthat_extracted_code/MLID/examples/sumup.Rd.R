library(MLID)


### Name: sumup
### Title: Sum the data up into higher level groups
### Aliases: sumup

### ** Examples

## Not run: 
##D data(ethnicities)
##D head(ethnicities)
##D id(ethnicities, vars = c("Arab","Other","Persons"), expected = TRUE)
##D # the expected value is very high relative to the ID
##D aggdata <- sumup(ethnicities, sumby = "LSOA", drop = "OA")
##D head(aggdata)
##D id(aggdata, vars=c("Arab","Other","Persons"), expected = TRUE)
##D # Note the sensitivity of the ID to the scale of analysis
## End(Not run)
data(aggdata)
head(aggdata)
moreagg <- sumup(ethnicities, sumby = "MSOA", drop = "LSOA")
head(moreagg)



