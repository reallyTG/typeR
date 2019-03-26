library(soilDB)


### Name: get_text_notes_from_NASIS_db
### Title: Extract text note data from a local NASIS Database
### Aliases: get_text_notes_from_NASIS_db
### Keywords: manip

### ** Examples

## Not run: 
##D # query text note data
##D t <- get_text_notes_from_NASIS_db()
##D 
##D # show contents text note data, includes: siteobs, site, pedon, horizon level text notes data.
##D str(t)
##D 
##D # view text categories for site text notes
##D table(t$site_text$textcat)
##D 
## End(Not run)



