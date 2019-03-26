library(UScensus2010)


### Name: choropleth
### Title: Choropleth Mapping
### Aliases: choropleth
### Keywords: choropleth

### ** Examples

## Not run: 
##D data(oregon.county10)
##D 
##D ###Using plot
##D choropleth(oregon.county10,"P0010001",color = list(fun = "rainbow", attr = list(4)),main="2010 Counties \n Oregon",type="plot",border="transparent")
##D 
##D 
##D 
##D ###Using spplot
##D choropleth(oregon.county10,"P0010001",main="2010 Counties \n Oregon",border="transparent",type="spplot")
## End(Not run)




