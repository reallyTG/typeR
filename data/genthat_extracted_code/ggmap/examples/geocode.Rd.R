library(ggmap)


### Name: geocode
### Title: Geocode
### Aliases: geocode geocodeQueryCheck

### ** Examples


## Not run: 
##D  # Server response can be slow; this cuts down check time.
##D 
##D # types of input
##D geocode("houston texas")
##D geocode("baylor university") # see known issues below
##D geocode("1600 pennsylvania avenue, washington dc")
##D geocode("the white house")
##D geocode(c("baylor university", "salvation army waco"))
##D 
##D 
##D 
##D 
##D # types of output
##D geocode("houston texas", output = "latlona")
##D geocode("houston texas", output = "more")
##D geocode("Baylor University", output = "more")
##D str(geocode("Baylor University", output = "all"))
##D 
##D 
##D # see how many requests we have left with google
##D geocodeQueryCheck()
##D geocode("one bear place, waco, texas")
##D geocode("houston texas", force = TRUE)
##D 
##D 
##D 
##D # known issues :
##D # (1) source = "dsk" can't reliably geocode colloquial place names
##D geocode("city hall houston")
##D geocode("rice university")
##D 
##D 
## End(Not run)




