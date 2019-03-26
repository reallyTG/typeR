library(taxize)


### Name: get_natservid
### Title: Get NatureServe taxonomic ID for a taxon name
### Aliases: get_natservid as.natservid as.natservid.natservid
###   as.natservid.character as.natservid.list as.natservid.numeric
###   as.natservid.data.frame as.data.frame.natservid get_natservid_

### ** Examples

## Not run: 
##D (x <- get_natservid("Helianthus annuus"))
##D attributes(x)
##D attr(x, "match")
##D attr(x, "multiple_matches")
##D attr(x, "pattern_match")
##D attr(x, "uri")
##D 
##D get_natservid('Gadus morhua')
##D get_natservid(c("Helianthus annuus", 'Gadus morhua'))
##D 
##D # specify rows to limit choices available
##D get_natservid('Ruby Quaker Moth', 'common')
##D get_natservid('Ruby*', 'common')
##D get_natservid('Ruby*', 'common', rows=1)
##D get_natservid('Ruby*', 'common', rows=1:2)
##D 
##D # When not found
##D get_natservid("howdy")
##D get_natservid(c('Gadus morhua', "howdy"))
##D 
##D # Convert a natservid without class information to a natservid class
##D # already a natservid, returns the same
##D as.natservid(get_natservid('Gadus morhua'))
##D # same
##D as.natservid(get_natservid(c('Gadus morhua', 'Pomatomus saltatrix')))
##D # character
##D as.natservid("ELEMENT_GLOBAL.2.101905")
##D # character vector, length > 1
##D as.natservid(c("ELEMENT_GLOBAL.2.101905", "ELEMENT_GLOBAL.2.101998"))
##D # list, either numeric or character
##D as.natservid(list("ELEMENT_GLOBAL.2.101905", "ELEMENT_GLOBAL.2.101998"))
##D ## dont check, much faster
##D as.natservid("ELEMENT_GLOBAL.2.101905", check = FALSE)
##D as.natservid(c("ELEMENT_GLOBAL.2.101905", "ELEMENT_GLOBAL.2.101998"),
##D   check = FALSE)
##D as.natservid(list("ELEMENT_GLOBAL.2.101905", "ELEMENT_GLOBAL.2.101998"),
##D   check = FALSE)
##D 
##D (out <- as.natservid(
##D   c("ELEMENT_GLOBAL.2.101905", "ELEMENT_GLOBAL.2.101998")))
##D data.frame(out)
##D as.natservid( data.frame(out) )
##D 
##D # Get all data back
##D get_natservid_("Ruby*")
##D get_natservid_("Ruby*", rows=1:3)
## End(Not run)



