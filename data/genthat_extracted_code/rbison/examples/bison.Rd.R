library(rbison)


### Name: bison
### Title: Search for and collect data from the USGS Bison API.
### Aliases: bison

### ** Examples

## Not run: 
##D bison(species="Bison bison", count=50)
##D 
##D # lots of results
##D res <- bison(species="Bison bison", count=2000)
##D res$summary
##D NROW(res$points)
##D 
##D out <- bison(species="Helianthus annuus", count=300)
##D out$summary # see summary
##D out$counties # see county data
##D out$states # see state data
##D bisonmap(out, tomap = "points")
##D bisonmap(out, tomap = "county")
##D bisonmap(out, tomap = "state")
##D 
##D # Search for a common name
##D bison(species="Tufted Titmouse", type="common_name")
##D 
##D # Constrain search to a certain county, 49015 is Emery County in Utah
##D bison(species="Helianthus annuus", countyFips = "49015")
##D 
##D # Constrain search to a certain county, specifying county name instead of 
##D # code
##D bison(species="Helianthus annuus", county = "Los Angeles")
##D # bison(species="Helianthus annuus", county = "Los")
##D 
##D # Constrain search to a certain aoi, which turns out to be Emery County, 
##D # Utah as well
##D bison(species="Helianthus annuus",
##D  aoi = "POLYGON((-111.06360117772908 38.84001566645886,
##D                  -110.80542246679359 39.37707771107983,
##D                  -110.20117441992392 39.17722368276862,
##D                  -110.20666758398464 38.90844075244811,
##D                  -110.63513438085685 38.67724220095734,
##D                  -111.06360117772908 38.84001566645886))")
##D 
##D # Constrain search to a certain aoibbox, which, you guessed it, is also 
##D # Emery Co., Utah
##D bison(species="Helianthus annuus", aoibbox = '-111.31,38.81,-110.57,39.21')
##D 
##D # Taxonomic serial number
##D bison(tsn = 162003)
##D ## If you don't have tsn's, search for a taxonomic serial number
##D library('taxize')
##D poa_tsn <- get_tsn('Poa annua')
##D bison(tsn = poa_tsn)
##D 
##D # Curl debugging and some of these examples aren't 
##D # that useful, but are given for demonstration purposes
##D ## get curl verbose output to see what's going on with your request
##D bison(tsn = 162003, count=1, verbose = TRUE)
##D ## set a timeout so that the call stops after time x, compare 1st to 2nd call
##D # bison(tsn=162003, count=1, timeout_ms = 1)
##D ## set cookies
##D bison(tsn=162003, count=1, cookie = "a=1;b=2")
##D ## user agent and verbose 
##D bison(tsn=162003, count=1, useragent = "rbison", 
##D   verbose = TRUE)
##D 
##D # Params - the params function accepts a number of search terms
##D ## Find the provider with ID 318.
##D bison(params='providerID:("318")')
##D ## Find all resources with id of '318,1902' OR '318,9151', with values 
##D ## separated by spaces.
##D bison(params='resourceID:("318,1902" "318,9151")')
##D ## Criterion may be combined using the semicolon (';') character, which 
##D ## translates to a logical AND operator. Note that field names and values 
##D ## are case sensitive.
##D bison(params='providerID:("408" "432");resourceID:("14027")')
##D ## Search by basisOfRecord, for specimen types in this case
##D bison(params='basisOfRecord:(specimen)')
##D ## Search by computedStateFips, 01 for Alabama
##D bison(params='computedStateFips:01')
##D ## Search by ITIStsn
##D bison(params='ITIStsn:162003')
##D ## Search by countryCode
##D bison(params='countryCode:US')
##D ## Search by ITIScommonName
##D bison(params='ITIScommonName:"Canada goose"')
## End(Not run)



