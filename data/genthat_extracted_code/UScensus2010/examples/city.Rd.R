library(UScensus2010)


### Name: city
### Title: Selects one or more CDP(s) from a given state
### Aliases: city
### Keywords: shapefiles CDP uscensus demography census

### ** Examples

## Not run: 
##D ##Load oregon.cdp10 data 
##D data(oregon.cdp10)
##D 
##D ##look at the list of oregon CDP names in alphabetic order
##D oregon.cdp10$name[order(oregon.cdp10$name)]
##D 
##D ##grab the CDP of Portland, OR
##D portland<-city(name="portland",state="or")
##D 
##D 
##D ##plot the polygon of Portland, OR
##D plot(portland)
##D title("Portland, OR")
## End(Not run)



