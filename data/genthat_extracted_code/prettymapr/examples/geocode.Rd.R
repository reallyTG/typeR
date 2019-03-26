library(prettymapr)


### Name: geocode
### Title: Geocode Locations
### Aliases: geocode

### ** Examples

# don't test to speed up checking time
## No test: 
geocode("wolfville, ns")
geocode("wolfville, ns", output="list")
geocode("halifax", limit=0)
geocode("Paddy's Pub Wolfville NS", source="google")
geocode(c("Houston, TX", "San Antonio TX", "Cleavland OH"), source="google")

#fails quietly
geocode("don't even think about geocoding this")
geocode("don't even think about geocoding this", output="list")
## End(No test)




