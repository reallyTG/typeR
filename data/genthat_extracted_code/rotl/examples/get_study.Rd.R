library(rotl)


### Name: get_study
### Title: Get all the trees associated with a particular study
### Aliases: get_study

### ** Examples

## Not run: 
##D that_one_study <- get_study(study_id="pg_719", object_format="phylo")
##D if (require(RNeXML)) { ## if RNeXML is installed get the object directly
##D    nexml_study <- get_study(study_id="pg_719", object_format="nexml")
##D } else { ## otherwise write it to a file
##D    get_study(study_id="pg_719", file_format="nexml", file=tempfile(fileext=".nexml"))
##D }
## End(Not run)



