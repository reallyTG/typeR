library(ecoengine)


### Name: checklist_details
### Title: Checklist details
### Aliases: checklist_details

### ** Examples

## Not run: 
##D spiders  <- ee_checklists(subject = "Spiders")
##D # Now retrieve all the details for each species on both lists
##D library(plyr)
##D spider_details <- ldply(spiders$url, checklist_details)
## End(Not run)



