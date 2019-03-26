library(taxize)


### Name: get_tsn
### Title: Get the TSN code for a search term.
### Aliases: get_tsn as.tsn as.tsn.tsn as.tsn.character as.tsn.list
###   as.tsn.numeric as.tsn.data.frame as.data.frame.tsn get_tsn_

### ** Examples

## Not run: 
##D get_tsn("Quercus douglasii")
##D get_tsn("Chironomus riparius")
##D get_tsn(c("Chironomus riparius","Quercus douglasii"))
##D splist <- c("annona cherimola", 'annona muricata', "quercus robur",
##D 		"shorea robusta", "pandanus patina", "oryza sativa", "durio zibethinus")
##D get_tsn(splist, verbose=FALSE)
##D 
##D # specify rows to limit choices available
##D get_tsn('Arni')
##D get_tsn('Arni', rows=1)
##D get_tsn('Arni', rows=1:2)
##D 
##D # When not found
##D get_tsn("howdy")
##D get_tsn(c("Chironomus riparius", "howdy"))
##D 
##D # Using common names
##D get_tsn(searchterm="black bear", searchtype="common")
##D 
##D # Convert a tsn without class information to a tsn class
##D as.tsn(get_tsn("Quercus douglasii")) # already a tsn, returns the same
##D as.tsn(get_tsn(c("Chironomus riparius","Pinus contorta"))) # same
##D as.tsn(19322) # numeric
##D as.tsn(c(19322,129313,506198)) # numeric vector, length > 1
##D as.tsn("19322") # character
##D as.tsn(c("19322","129313","506198")) # character vector, length > 1
##D as.tsn(list("19322","129313","506198")) # list, either numeric or character
##D ## dont check, much faster
##D as.tsn("19322", check=FALSE)
##D as.tsn(19322, check=FALSE)
##D as.tsn(c("19322","129313","506198"), check=FALSE)
##D as.tsn(list("19322","129313","506198"), check=FALSE)
##D 
##D (out <- as.tsn(c(19322,129313,506198)))
##D data.frame(out)
##D as.tsn( data.frame(out) )
##D 
##D # Get all data back
##D get_tsn_("Arni")
##D get_tsn_("Arni", rows=1)
##D get_tsn_("Arni", rows=1:2)
##D get_tsn_(c("asdfadfasd","Pinus contorta"), rows=1:5)
## End(Not run)



