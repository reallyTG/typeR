library(genomicper)


### Name: get_pathways
### Title: Pathways
### Aliases: get_pathways
### Keywords: annotation pathways

### ** Examples

## Not run: 
##D # get pathways source = "kegg"
##D ## library(KEGG.db)
##D 
##D # Create new environment to save data:
##D gper.env <- new.env()
##D 
##D # paths <- get_pathways(source="kegg",all_paths=FALSE,envir = gper.env)
##D 	# when prompted introduce species as listed
##D #	hsa
##D 	# if all_paths set to TRUE. All pathways are downloaded automatically
##D 	# if all_paths set to FALSE. Introduce list of pathways separated by ","
##D 	#hsa00010,hsa00020,hsa04670,hsa04672,hsa04710,hsa04720,hsa04722,hsa04730
##D 	
##D 
##D # get pathways source = "reactome"
##D ## library(reactome.db)
##D #paths <- get_pathways(source="reactome",all_paths=FALSE,envir=".GlobalEnv")
##D 	# when prompted introduce species as listed
##D #	Homo sapiens
##D 	# when prompted introduce prefix to be assigned to pathways
##D 	#HSA
##D 	# if all_paths set to TRUE. All pathways are downloaded automatically
##D 	# IF all_paths set to FALSE, select a subset of pathway identifiers from 
##D 	# list. Separated by ","
##D 	1500931,1299503,...
## End(Not run)



