library(rebird)


### Name: ebirdgeo
### Title: Sightings at location determined by latitude/longitude
### Aliases: ebirdgeo

### ** Examples

## Not run: 
##D ebirdgeo('amegfi', 42, -76) # American Goldfinch
##D ebirdgeo(species_code('spinus tristis'), 42, -76) # same as above
##D ebirdgeo(lat=42, lng=-76, max=10, provisional=TRUE, hotspot=TRUE)
##D ebirdgeo(species_code('Anas platyrhynchos'), 39, -121, max=5)
##D library('httr')
##D ebirdgeo(species_code('Anas platyrhynchos'), 39, -121, max=5, config=verbose())
##D ebirdgeo(species_code('Anas platyrhynchos'), 39, -121, max=5, config=progress())
##D # ebirdgeo(species_code('Anas platyrhynchos'), 39, -121, max=5, config=timeout(0.1))
## End(Not run)



