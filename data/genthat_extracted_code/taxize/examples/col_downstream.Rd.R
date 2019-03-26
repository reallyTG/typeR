library(taxize)


### Name: col_downstream
### Title: Use Catalogue of Life to get downstream taxa to a given
###   taxonomic level.
### Aliases: col_downstream

### ** Examples

## Not run: 
##D # Some basic examples
##D col_downstream(name="Apis", downto="species")
##D col_downstream(name="Bryophyta", downto="family")
##D 
##D # get classes down from the kingdom Animalia
##D col_downstream(name="Animalia", downto="class")
##D col_downstream(name="Animalia", downto="class", intermediate=TRUE)
##D 
##D # An example that takes a bit longer
##D col_downstream(name=c("Plantae", "Animalia"), downto="class")
##D 
##D # Using a checklist from a specific year
##D col_downstream(name="Bryophyta", downto="family", checklist=2009)
##D 
##D # By id
##D col_downstream(id='576d098d770a39d09e2bcfa1c0896b26', downto="species",
##D   checklist=2012)
## End(Not run)



