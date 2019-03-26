library(taxize)


### Name: get_gbifid
### Title: Get the GBIF backbone taxon ID from taxonomic names.
### Aliases: get_gbifid as.gbifid as.gbifid.gbifid as.gbifid.character
###   as.gbifid.list as.gbifid.numeric as.gbifid.data.frame
###   as.data.frame.gbifid get_gbifid_

### ** Examples

## Not run: 
##D get_gbifid(sciname='Poa annua')
##D get_gbifid(sciname='Pinus contorta')
##D get_gbifid(sciname='Puma concolor')
##D 
##D # multiple names
##D get_gbifid(c("Poa annua", "Pinus contorta"))
##D 
##D # specify rows to limit choices available
##D get_gbifid(sciname='Pinus')
##D get_gbifid(sciname='Pinus', rows=10)
##D get_gbifid(sciname='Pinus', rows=1:3)
##D 
##D # When not found, NA given
##D get_gbifid(sciname="uaudnadndj")
##D get_gbifid(c("Chironomus riparius", "uaudnadndj"))
##D 
##D # Narrow down results to a division or rank, or both
##D ## Satyrium example
##D ### Results w/o narrowing
##D get_gbifid("Satyrium")
##D ### w/ phylum
##D get_gbifid("Satyrium", phylum = "Tracheophyta")
##D get_gbifid("Satyrium", phylum = "Arthropoda")
##D ### w/ phylum & rank
##D get_gbifid("Satyrium", phylum = "Arthropoda", rank = "genus")
##D 
##D ## Rank example
##D get_gbifid("Poa", method = "lookup")
##D get_gbifid("Poa", method = "lookup", rank = "genus")
##D get_gbifid("Poa", method = "lookup", family = "Thripidae")
##D 
##D # Fuzzy filter on any filtering fields
##D ## uses grep on the inside
##D get_gbifid("Satyrium", phylum = "arthropoda")
##D get_gbifid("A*", method = "lookup", order = "*tera")
##D get_gbifid("A*", method = "lookup", order = "*ales")
##D 
##D # Convert a uid without class information to a uid class
##D as.gbifid(get_gbifid("Poa annua")) # already a uid, returns the same
##D as.gbifid(get_gbifid(c("Poa annua","Puma concolor"))) # same
##D as.gbifid(2704179) # numeric
##D as.gbifid(c(2704179,2435099,3171445)) # numeric vector, length > 1
##D as.gbifid("2704179") # character
##D as.gbifid(c("2704179","2435099","3171445")) # character vector, length > 1
##D as.gbifid(list("2704179","2435099","3171445")) # list, either numeric or character
##D ## dont check, much faster
##D as.gbifid("2704179", check=FALSE)
##D as.gbifid(2704179, check=FALSE)
##D as.gbifid(2704179, check=FALSE)
##D as.gbifid(c("2704179","2435099","3171445"), check=FALSE)
##D as.gbifid(list("2704179","2435099","3171445"), check=FALSE)
##D 
##D (out <- as.gbifid(c(2704179,2435099,3171445)))
##D data.frame(out)
##D as.uid( data.frame(out) )
##D 
##D # Get all data back
##D get_gbifid_("Puma concolor")
##D get_gbifid_(c("Pinus", "uaudnadndj"))
##D get_gbifid_(c("Pinus", "Puma"), rows=5)
##D get_gbifid_(c("Pinus", "Puma"), rows=1:5)
##D 
##D # use curl options
##D invisible(get_gbifid("Quercus douglasii", verbose = TRUE))
## End(Not run)



