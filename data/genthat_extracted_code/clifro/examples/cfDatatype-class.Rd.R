library(clifro)


### Name: cfDatatype-class
### Title: The Clifro Datatype Object
### Aliases: cfDatatype-class cf_datatype cfDatatype

### ** Examples

## Not run: 
##D # Select the surface wind datatype manually (unknown tree nodes)
##D hourly.wind.dt = cf_datatype()
##D #  2  --> Datatype:        Wind
##D #  1  --> Datatype 2:      Surface Wind
##D #  2  --> Options:         Hourly Wind
##D # (2) --> Another option:  No
##D #  3  --> Units:           Knots
##D hourly.wind.dt
##D 
##D # Or select the datatype programatically (using the selections seen above)
##D hourly.wind.dt = cf_datatype(2, 1, 2, 3)
##D hourly.wind.dt
## End(Not run)



