library(RNeXML)


### Name: add_basic_meta
### Title: Add basic metadata
### Aliases: add_basic_meta

### ** Examples

nex <- add_basic_meta(title = "My test title",
             description = "A description of my test",
             creator = "Carl Boettiger <cboettig@gmail.com>",
             publisher = "unpublished data",
             pubdate = "2012-04-01")

 ## Adding citation to an R package:
 nexml <- add_basic_meta(citation=citation("ape"))
## Not run: 
##D  ## Use knitcitations package to add a citation by DOI:
##D  library(knitcitations)
##D  nexml <- add_basic_meta(citation = bib_metadata("10.2307/2408428"))
##D  
## End(Not run)



