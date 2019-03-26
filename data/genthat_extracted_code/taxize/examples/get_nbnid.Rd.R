library(taxize)


### Name: get_nbnid
### Title: Get the UK National Biodiversity Network ID from taxonomic
###   names.
### Aliases: get_nbnid as.nbnid as.nbnid.nbnid as.nbnid.character
###   as.nbnid.list as.nbnid.data.frame as.data.frame.nbnid get_nbnid_

### ** Examples

## Not run: 
##D get_nbnid(name='Poa annua')
##D get_nbnid(name='Poa annua', rec_only=TRUE)
##D get_nbnid(name='Poa annua', rank='Species')
##D get_nbnid(name='Poa annua', rec_only=TRUE, rank='Species')
##D get_nbnid(name='Pinus contorta')
##D 
##D # The NBN service handles common names too
##D get_nbnid(name='red-winged blackbird')
##D 
##D # specify rows to limit choices available
##D get_nbnid('Poa annua')
##D get_nbnid('Poa annua', rows=1)
##D get_nbnid('Poa annua', rows=25)
##D get_nbnid('Poa annua', rows=1:2)
##D 
##D # When not found
##D get_nbnid(name="uaudnadndj")
##D get_nbnid(c("Zootoca vivipara", "uaudnadndj"))
##D get_nbnid(c("Zootoca vivipara","Chironomus riparius", "uaudnadndj"))
##D 
##D # Convert an nbnid without class information to a nbnid class
##D as.nbnid(get_nbnid("Zootoca vivipara")) # already a nbnid, returns the same
##D as.nbnid(get_nbnid(c("Zootoca vivipara","Pinus contorta"))) # same
##D as.nbnid('NHMSYS0001706186') # character
##D # character vector, length > 1
##D as.nbnid(c("NHMSYS0001706186","NHMSYS0000494848","NBNSYS0000010867"))
##D # list
##D as.nbnid(list("NHMSYS0001706186","NHMSYS0000494848","NBNSYS0000010867"))
##D ## dont check, much faster
##D as.nbnid('NHMSYS0001706186', check=FALSE)
##D as.nbnid(list("NHMSYS0001706186","NHMSYS0000494848","NBNSYS0000010867"),
##D   check=FALSE)
##D 
##D (out <- as.nbnid(c("NHMSYS0001706186","NHMSYS0000494848",
##D   "NBNSYS0000010867")))
##D data.frame(out)
##D as.nbnid( data.frame(out) )
##D 
##D # Get all data back
##D get_nbnid_("Zootoca vivipara")
##D get_nbnid_("Poa annua", rows=2)
##D get_nbnid_("Poa annua", rows=1:2)
##D get_nbnid_(c("asdfadfasd","Pinus contorta"), rows=1:5)
##D 
##D # use curl options
##D invisible(get_nbnid("Quercus douglasii", verbose = TRUE))
## End(Not run)



