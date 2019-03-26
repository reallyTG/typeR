library(XBRL)


### Name: Low-level functions
### Title: Set of low-level functions to parse an XBRL file and extract
###   information from it.
### Aliases: xbrlParse xbrlFree xbrlGetSchemaName xbrlGetLinkbaseNames
###   xbrlGetImportNames xbrlProcessElements xbrlProcessLabels
###   xbrlProcessArcs xbrlProcessRoles xbrlProcessContexts xbrlProcessFacts
###   xbrlProcessUnits xbrlProcessFootnotes
### Keywords: XBRL low-level

### ** Examples

## Not run: 
##D ## Setting stringsAsFactors = FALSE is highly recommended
##D ## to avoid data frames to create factors from character vectors.
##D options(stringsAsFactors = FALSE)
##D 
##D ## XBRL instance file to be analyzed.
##D ## NOTE: in this case, inst needs to be a local file, or accessible
##D ##       as http (not https).
##D inst <- "ko-20130927.xml"
##D ## Parse the instance (doc is an pointer to
##D ## external memory that needs to be freed after use):
##D doc <- xbrlParse(inst)
##D ## Get a data frame with facts:
##D fct <- xbrlProcessFacts(doc)
##D ## Get a data frame with contexts:
##D cts <- xbrlProcessContexts(doc)
##D ## Get a data frame with units:
##D unt <- xbrlProcessUnits(doc)
##D sch <- xbrlGetSchemaName(doc)
##D ## Free the external memory used:
##D xbrlFree(doc)
##D 
##D dname <- dirname(inst)
##D ## Parse the schema file:
##D docS <- xbrlParse(paste0(dname,"/",sch))
##D ## Get roles:
##D rls <- xbrlProcessRoles(docS)
##D head(rls)
##D ## Free the external memory used:
##D xbrlFree(docS)
## End(Not run)



