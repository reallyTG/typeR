library(taxize)


### Name: get_tpsid
### Title: Get the NameID codes from Tropicos for taxonomic names.
### Aliases: get_tpsid as.tpsid as.tpsid.tpsid as.tpsid.character
###   as.tpsid.list as.tpsid.numeric as.tpsid.data.frame
###   as.data.frame.tpsid get_tpsid_

### ** Examples

## Not run: 
##D get_tpsid(sciname='Poa annua')
##D get_tpsid(sciname='Pinus contorta')
##D 
##D get_tpsid(c("Poa annua", "Pinus contorta"))
##D 
##D # specify rows to limit choices available
##D get_tpsid('Poa annua')
##D get_tpsid('Poa annua', rows=1)
##D get_tpsid('Poa annua', rows=25)
##D get_tpsid('Poa annua', rows=1:2)
##D 
##D # When not found, NA given (howdy is not a species name, and Chrinomus is a fly)
##D get_tpsid("howdy")
##D get_tpsid(c("Chironomus riparius", "howdy"))
##D 
##D # Narrow down results to a division or rank, or both
##D ## Satyrium example
##D ### Results w/o narrowing
##D get_tpsid("Satyrium")
##D ### w/ rank
##D get_tpsid("Satyrium", rank = "var.")
##D get_tpsid("Satyrium", rank = "sp.")
##D 
##D ## w/ family
##D get_tpsid("Poa")
##D get_tpsid("Poa", family = "Iridaceae")
##D get_tpsid("Poa", family = "Orchidaceae")
##D get_tpsid("Poa", family = "Orchidaceae", rank = "gen.")
##D 
##D # Fuzzy filter on any filtering fields
##D ## uses grep on the inside
##D get_tpsid("Poa", family = "orchidaceae")
##D get_tpsid("Aga", fuzzy = TRUE, parent = "*idae")
##D 
##D # pass to classification function to get a taxonomic hierarchy
##D classification(get_tpsid(sciname='Poa annua'))
##D 
##D # factor class names are converted to character internally
##D spnames <- as.factor(c("Poa annua", "Pinus contorta"))
##D class(spnames)
##D get_tpsid(spnames)
##D 
##D # pass in a list, works fine
##D get_tpsid(list("Poa annua", "Pinus contorta"))
##D 
##D # Convert a tpsid without class information to a tpsid class
##D as.tpsid(get_tpsid("Pinus contorta")) # already a tpsid, returns the same
##D as.tpsid(get_tpsid(c("Chironomus riparius","Pinus contorta"))) # same
##D as.tpsid(24900183) # numeric
##D as.tpsid(c(24900183,50150089,50079838)) # numeric vector, length > 1
##D as.tpsid("24900183") # character
##D as.tpsid(c("24900183","50150089","50079838")) # character vector, length > 1
##D as.tpsid(list("24900183","50150089","50079838")) # list, either numeric or character
##D ## dont check, much faster
##D as.tpsid("24900183", check=FALSE)
##D as.tpsid(24900183, check=FALSE)
##D as.tpsid(c("24900183","50150089","50079838"), check=FALSE)
##D as.tpsid(list("24900183","50150089","50079838"), check=FALSE)
##D 
##D (out <- as.tpsid(c(24900183,50150089,50079838)))
##D data.frame(out)
##D as.tpsid( data.frame(out) )
##D 
##D # Get all data back
##D get_tpsid_("Poa annua")
##D get_tpsid_("Poa annua", rows=2)
##D get_tpsid_("Poa annua", rows=1:2)
##D get_tpsid_(c("asdfadfasd","Pinus contorta"), rows=1:5)
##D 
##D # use curl options
##D invisible(get_tpsid("Quercus douglasii", verbose = TRUE))
## End(Not run)



