library(Guerry)


### Name: gfrance
### Title: Map of France in 1830 with the Guerry data
### Aliases: gfrance
### Keywords: datasets spatial

### ** Examples

data(gfrance)
names(gfrance)  ## list @data variables
plot(gfrance)   ## just show the map outline

# Show basic choropleth plots of some of the variables
spplot(gfrance, "Crime_pers")
spplot(gfrance, "Crime_prop")

# Note that spplot assumes all variables are on the same scale for comparative plots
# transform variables to ranks (as Guerry did)
 
## Not run: 
##D local({
##D   gfrance$Crime_pers <- rank(gfrance$Crime_pers)
##D   gfrance$Crime_prop <- rank(gfrance$Crime_prop)
##D   gfrance$Literacy <- rank(gfrance$Literacy)
##D   gfrance$Donations <- rank(gfrance$Donations)
##D   gfrance$Infants <- rank(gfrance$Infants)
##D   gfrance$Suicides <- rank(gfrance$Suicides)
##D    	
##D   spplot(gfrance, c("Crime_pers", "Crime_prop", "Literacy", "Donations", "Infants", "Suicides"), 
##D     layout=c(3,2), as.table=TRUE, main="Guerry's main moral variables")
##D }) 
## End(Not run)



