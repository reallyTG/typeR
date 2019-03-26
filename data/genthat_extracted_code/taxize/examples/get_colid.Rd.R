library(taxize)


### Name: get_colid
### Title: Get the Catalogue of Life ID from taxonomic names.
### Aliases: get_colid as.colid as.colid.colid as.colid.character
###   as.colid.list as.colid.data.frame as.data.frame.colid get_colid_

### ** Examples

## Not run: 
##D get_colid(sciname='Poa annua')
##D get_colid(sciname='Pinus contorta')
##D get_colid(sciname='Puma concolor')
##D # get_colid(sciname="Abudefduf saxatilis")
##D 
##D get_colid(c("Poa annua", "Pinus contorta"))
##D 
##D # specify rows to limit choices available
##D get_colid(sciname='Poa annua')
##D get_colid(sciname='Poa annua', rows=1)
##D get_colid(sciname='Poa annua', rows=2)
##D get_colid(sciname='Poa annua', rows=1:2)
##D 
##D # When not found
##D get_colid(sciname="uaudnadndj")
##D get_colid(c("Chironomus riparius", "uaudnadndj"))
##D 
##D # Narrow down results to a division or rank, or both
##D ## Satyrium example
##D ### Results w/o narrowing
##D get_colid("Satyrium")
##D ### w/ division
##D get_colid("Satyrium", kingdom = "Plantae")
##D get_colid("Satyrium", kingdom = "Animalia")
##D 
##D ## Rank example
##D get_colid("Poa")
##D get_colid("Poa", kingdom = "Plantae")
##D get_colid("Poa", kingdom = "Animalia")
##D 
##D # Fuzzy filter on any filtering fields
##D ## uses grep on the inside
##D get_colid("Satyrium", kingdom = "p")
##D 
##D # Convert a uid without class information to a uid class
##D as.colid(get_colid("Chironomus riparius")) # already a uid, returns the same
##D as.colid(get_colid(c("Chironomus riparius","Pinus contorta"))) # same
##D as.colid("714831352ad94741e4321eccdeb29f58") # character
##D # character vector, length > 1
##D as.colid(c("714831352ad94741e4321eccdeb29f58", "3b35900f74ff6e4b073ddb95c32b1f8d"))
##D # list, either numeric or character
##D as.colid(list("714831352ad94741e4321eccdeb29f58", "3b35900f74ff6e4b073ddb95c32b1f8d"))
##D ## dont check, much faster
##D as.colid("714831352ad94741e4321eccdeb29f58", check=FALSE)
##D as.colid(c("714831352ad94741e4321eccdeb29f58", "3b35900f74ff6e4b073ddb95c32b1f8d"),
##D  check=FALSE)
##D as.colid(list("714831352ad94741e4321eccdeb29f58", "3b35900f74ff6e4b073ddb95c32b1f8d"),
##D  check=FALSE)
##D 
##D (out <- as.colid(c("714831352ad94741e4321eccdeb29f58", "3b35900f74ff6e4b073ddb95c32b1f8d")))
##D data.frame(out)
##D as.colid( data.frame(out) )
##D 
##D # Get all data back
##D get_colid_("Poa annua")
##D get_colid_("Poa annua", rows=2)
##D get_colid_("Poa annua", rows=1:2)
##D get_colid_(c("asdfadfasd","Pinus contorta"))
##D 
##D get_colid(sciname="Andropadus nigriceps fusciceps", rows=1)
##D 
##D # use curl options
##D library("httr")
##D get_colid("Quercus douglasii", config=verbose())
##D bb <- get_colid("Quercus douglasii", config=progress())
## End(Not run)



