library(taxize)


### Name: get_boldid
### Title: Get the BOLD (Barcode of Life) code for a search term.
### Aliases: get_boldid as.boldid as.boldid.boldid as.boldid.character
###   as.boldid.list as.boldid.numeric as.boldid.data.frame
###   as.data.frame.boldid get_boldid_

### ** Examples

## Not run: 
##D get_boldid(searchterm = "Agapostemon")
##D get_boldid(searchterm = "Chironomus riparius")
##D get_boldid(c("Chironomus riparius","Quercus douglasii"))
##D splist <- names_list('species')
##D get_boldid(splist, verbose=FALSE)
##D 
##D # Fuzzy searching
##D get_boldid(searchterm="Osmi", fuzzy=TRUE)
##D 
##D # Get back a subset
##D get_boldid(searchterm="Osmi", fuzzy=TRUE, rows = 1)
##D get_boldid(searchterm="Osmi", fuzzy=TRUE, rows = 1:10)
##D get_boldid(searchterm=c("Osmi","Aga"), fuzzy=TRUE, rows = 1)
##D get_boldid(searchterm=c("Osmi","Aga"), fuzzy=TRUE, rows = 1:3)
##D 
##D # When not found
##D get_boldid("howdy")
##D get_boldid(c("Chironomus riparius", "howdy"))
##D get_boldid('Epicordulia princeps')
##D get_boldid('Arigomphus furcifer')
##D get_boldid("Cordulegaster erronea")
##D get_boldid("Nasiaeshna pentacantha")
##D 
##D # Narrow down results to a division or rank, or both
##D ## Satyrium example
##D ### Results w/o narrowing
##D get_boldid("Satyrium")
##D ### w/ phylum
##D get_boldid("Satyrium", division = "Plants")
##D get_boldid("Satyrium", division = "Animals")
##D 
##D ## Rank example
##D get_boldid("Osmia", fuzzy = TRUE)
##D get_boldid("Osmia", fuzzy = TRUE, rank = "genus")
##D 
##D # Fuzzy filter on any filtering fields
##D ## uses grep on the inside
##D get_boldid("Satyrium", division = "anim")
##D get_boldid("Aga", fuzzy = TRUE, parent = "*idae")
##D 
##D # Convert a boldid without class information to a boldid class
##D as.boldid(get_boldid("Agapostemon")) # already a boldid, returns the same
##D as.boldid(get_boldid(c("Agapostemon","Quercus douglasii"))) # same
##D as.boldid(1973) # numeric
##D as.boldid(c(1973,101009,98597)) # numeric vector, length > 1
##D as.boldid("1973") # character
##D as.boldid(c("1973","101009","98597")) # character vector, length > 1
##D as.boldid(list("1973","101009","98597")) # list, either numeric or character
##D ## dont check, much faster
##D as.boldid("1973", check=FALSE)
##D as.boldid(1973, check=FALSE)
##D as.boldid(c("1973","101009","98597"), check=FALSE)
##D as.boldid(list("1973","101009","98597"), check=FALSE)
##D 
##D (out <- as.boldid(c(1973,101009,98597)))
##D data.frame(out)
##D as.boldid( data.frame(out) )
##D 
##D # Get all data back
##D get_boldid_("Osmia", fuzzy=TRUE, rows=1:5)
##D get_boldid_("Osmia", fuzzy=TRUE, rows=1)
##D get_boldid_(c("Osmi","Aga"), fuzzy=TRUE, rows = 1:3)
## End(Not run)



