library(UScensus2010)


### Name: areaPoly
### Title: Area of the polygons in SpatialPolygonsDataFrame
### Aliases: areaPoly
### Keywords: ~kwd1 ~kwd2

### ** Examples

## Not run: 
##D data(oregon.county10)
##D 
##D 
##D 
##D ## Build density using areaPoly()
##D den00<-oregon.county10$P0010001/areaPoly(oregon.county10)
##D oregon.county10$den00<-den00
##D 
##D choropleth(oregon.county10,"den00",color = list(fun = "rainbow", attr = list(4)),main="2010 US Counties \n Oregon",type="plot",border="transparent")
## End(Not run)







