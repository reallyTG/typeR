library(taxize)


### Name: get_tolid
### Title: Get the OTT id for a search term
### Aliases: get_tolid as.tolid as.tolid.tolid as.tolid.character
###   as.tolid.list as.tolid.numeric as.tolid.data.frame
###   as.data.frame.tolid get_tolid_

### ** Examples

## Not run: 
##D get_tolid(sciname = "Quercus douglasii")
##D get_tolid(sciname = "Chironomus riparius")
##D get_tolid(c("Chironomus riparius","Quercus douglasii"))
##D splist <- c("annona cherimola", 'annona muricata', "quercus robur",
##D 		"shorea robusta", "pandanus patina", "oryza sativa", "durio zibethinus")
##D get_tolid(splist, verbose=FALSE)
##D 
##D # specify rows to limit choices available
##D get_tolid('Arni')
##D get_tolid('Arni', rows=1)
##D get_tolid('Arni', rows=1:2)
##D 
##D # When not found
##D get_tolid("howdy")
##D get_tolid(c("Chironomus riparius", "howdy"))
##D 
##D # Convert a tol without class information to a tol class
##D as.tolid(get_tolid("Quercus douglasii")) # already a tol, returns the same
##D as.tolid(get_tolid(c("Chironomus riparius","Pinus contorta"))) # same
##D as.tolid(3930798) # numeric
##D as.tolid(c(3930798,515712,872577)) # numeric vector, length > 1
##D as.tolid("3930798") # character
##D as.tolid(c("3930798","515712","872577")) # character vector, length > 1
##D as.tolid(list("3930798","515712","872577")) # list, either numeric or character
##D ## dont check, much faster
##D as.tolid("3930798", check=FALSE)
##D as.tolid(3930798, check=FALSE)
##D as.tolid(c("3930798","515712","872577"), check=FALSE)
##D as.tolid(list("3930798","515712","872577"), check=FALSE)
##D 
##D (out <- as.tolid(c(3930798,515712,872577)))
##D data.frame(out)
##D as.tolid( data.frame(out) )
##D 
##D # Get all data back
##D get_tolid_(sciname="Arni")
##D get_tolid_("Arni", rows=1)
##D get_tolid_("Arni", rows=1:2)
##D get_tolid_(c("asdfadfasd","Pinus contorta"))
## End(Not run)



