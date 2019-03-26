library(taxize)


### Name: get_eolid
### Title: Get the EOL ID from Encyclopedia of Life from taxonomic names.
### Aliases: get_eolid as.eolid as.eolid.eolid as.eolid.character
###   as.eolid.list as.eolid.numeric as.eolid.data.frame
###   as.data.frame.eolid get_eolid_

### ** Examples

## Not run: 
##D get_eolid(sciname='Pinus contorta')
##D get_eolid(sciname='Puma concolor')
##D 
##D get_eolid(c("Puma concolor", "Pinus contorta"))
##D 
##D # specify rows to limit choices available
##D get_eolid('Poa annua')
##D get_eolid('Poa annua', rows=1)
##D get_eolid('Poa annua', rows=2)
##D get_eolid('Poa annua', rows=1:2)
##D 
##D # When not found
##D get_eolid(sciname="uaudnadndj")
##D get_eolid(c("Chironomus riparius", "uaudnadndj"))
##D 
##D # Convert a eolid without class information to a eolid class
##D # already a eolid, returns the same
##D as.eolid(get_eolid("Chironomus riparius"))
##D # same
##D as.eolid(get_eolid(c("Chironomus riparius","Pinus contorta")))
##D # numeric
##D as.eolid(24954444)
##D # numeric vector, length > 1
##D as.eolid(c(24954444,51389511,57266265))
##D # character
##D as.eolid("24954444")
##D # character vector, length > 1
##D as.eolid(c("24954444","51389511","57266265"))
##D # list, either numeric or character
##D as.eolid(list("24954444","51389511","57266265"))
##D ## dont check, much faster
##D as.eolid("24954444", check=FALSE)
##D as.eolid(24954444, check=FALSE)
##D as.eolid(c("24954444","51389511","57266265"), check=FALSE)
##D as.eolid(list("24954444","51389511","57266265"), check=FALSE)
##D 
##D (out <- as.eolid(c(24954444,51389511,57266265)))
##D data.frame(out)
##D as.eolid( data.frame(out) )
##D 
##D # Get all data back
##D get_eolid_("Poa annua")
##D get_eolid_("Poa annua", rows=2)
##D get_eolid_("Poa annua", rows=1:2)
##D get_eolid_(c("asdfadfasd", "Pinus contorta"))
## End(Not run)



