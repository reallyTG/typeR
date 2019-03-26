library(taxize)


### Name: col_children
### Title: Search Catalogue of Life for for direct children of a particular
###   taxon.
### Aliases: col_children

### ** Examples

## Not run: 
##D # A basic example
##D col_children(name="Apis")
##D 
##D # An example where there is no classification, results in data.frame with
##D # no rows
##D col_children(id='b2f88f382aa5568f93a97472c6be6516')
##D 
##D # Use a specific year's checklist
##D col_children(name="Apis", checklist=2012)
##D col_children(name="Apis", checklist=2009)
##D 
##D # Pass in many names or many id's
##D out <- col_children(name=c("Buteo","Apis","Accipiter","asdf"),
##D   checklist = "2012")
##D out$Apis # get just the output you want
##D library("plyr")
##D ldply(out) # or combine to one data.frame
##D 
##D # or pass many id's
##D ids <- c('abe977b1d27007a76dd12a5c93a637bf',
##D   'b2f88f382aa5568f93a97472c6be6516')
##D out <- col_children(id = ids, checklist=2012)
##D library("plyr")
##D ldply(out) # combine to one data.frame
## End(Not run)



