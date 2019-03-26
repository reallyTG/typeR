library(taxize)


### Name: get_wormsid
### Title: Get Worms ID for a taxon name
### Aliases: get_wormsid as.wormsid as.wormsid.wormsid as.wormsid.character
###   as.wormsid.list as.wormsid.numeric as.wormsid.data.frame
###   as.data.frame.wormsid get_wormsid_

### ** Examples

## Not run: 
##D (x <- get_wormsid('Platanista gangetica'))
##D attributes(x)
##D attr(x, "match")
##D attr(x, "multiple_matches")
##D attr(x, "pattern_match")
##D attr(x, "uri")
##D 
##D get_wormsid('Gadus morhua')
##D get_wormsid('Pomatomus saltatrix')
##D get_wormsid(c("Platanista gangetica", "Lichenopora neapolitana"))
##D 
##D # by common name
##D get_wormsid("dolphin", 'common')
##D get_wormsid("clam", 'common')
##D 
##D # specify rows to limit choices available
##D get_wormsid('Plat')
##D get_wormsid('Plat', rows=1)
##D get_wormsid('Plat', rows=1:2)
##D 
##D # When not found
##D get_wormsid("howdy")
##D get_wormsid(c('Gadus morhua', "howdy"))
##D 
##D # Convert a wormsid without class information to a wormsid class
##D # already a wormsid, returns the same
##D as.wormsid(get_wormsid('Gadus morhua'))
##D # same
##D as.wormsid(get_wormsid(c('Gadus morhua', 'Pomatomus saltatrix')))
##D # numeric
##D as.wormsid(126436)
##D # numeric vector, length > 1
##D as.wormsid(c(126436,151482))
##D # character
##D as.wormsid("126436")
##D # character vector, length > 1
##D as.wormsid(c("126436","151482"))
##D # list, either numeric or character
##D as.wormsid(list("126436","151482"))
##D ## dont check, much faster
##D as.wormsid("126436", check=FALSE)
##D as.wormsid(126436, check=FALSE)
##D as.wormsid(c("126436","151482"), check=FALSE)
##D as.wormsid(list("126436","151482"), check=FALSE)
##D 
##D (out <- as.wormsid(c(126436,151482)))
##D data.frame(out)
##D as.wormsid( data.frame(out) )
##D 
##D # Get all data back
##D get_wormsid_("Plat")
##D get_wormsid_("Plat", rows=1)
##D get_wormsid_("Plat", rows=1:2)
##D get_wormsid_("Plat", rows=1:75)
##D # get_wormsid_(c("asdfadfasd","Plat"), rows=1:5)
## End(Not run)



