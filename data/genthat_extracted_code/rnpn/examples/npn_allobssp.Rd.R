library(rnpn)


### Name: npn_allobssp
### Title: Get all observations for a particular species or set of species
### Aliases: npn_allobssp

### ** Examples

## Not run: 
##D # Lookup names
##D lookup_names(name='Pinus', type='genus')
##D 
##D # Get data on one species
##D npn_allobssp(speciesid = 52, startdate='2008-01-01', enddate='2011-12-31')
##D 
##D # Get data on two species
##D npn_allobssp(speciesid = c(52, 53), startdate='2008-01-01', enddate='2011-12-31')
##D 
##D # Get data on one species, convert to a single data.frame
##D npn_allobssp(speciesid = 52, startdate='2008-01-01', enddate='2011-12-31')
## End(Not run)



