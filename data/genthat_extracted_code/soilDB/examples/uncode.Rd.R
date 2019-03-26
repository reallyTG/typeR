library(soilDB)


### Name: uncode
### Title: Convert coded values returned from NASIS and SDA queries to
###   factors
### Aliases: metadata uncode code
### Keywords: manip

### ** Examples

## Not run: 
##D # query component by nationalmusym
##D comp = fetchSDA_component(WHERE = "nationalmusym = '2vzcp'")
##D s = site(comp$spc)
##D s = uncode(s, NASIS = FALSE)
##D levels(s$taxorder)
## End(Not run)



