library(ungeneanno)


### Name: ungeneanno-package
### Title: Collate Gene Annotation Data from Uniprot and NIH Gene Databases
### Aliases: ungeneanno ungeneanno-package

### ** Examples

## Not run: 
##D ## Create geneanno object and set save directory
##D ga <- geneanno()
##D ga@fileroot <- "~/Desktop"
##D 
##D ## Parse input gene names and group identifiers into unique lists
##D data("genematrix")
##D ga <- getUniqueGeneList(ga,genematrix)
##D 
##D ## Query databases and Parse responses
##D gs <- getGeneSummary(ga)
##D 
##D ## Create vector of vectors containing gene names for each group identifier
##D dgl <- getGroupGeneList(ga,genematrix)
##D 
##D ## Collate data into out files
##D produceOutputFiles(ga, dgl, gs)
##D 
##D ## Query PubMed database
##D query <- "Thompson IR HIV"
##D ReturnedPublications <- getPublicationList(query)
##D 
##D ## List PubMedIDs from PubMed query
##D for (i in 1:length(ReturnedPublications)){
##D   print(ReturnedPublications[[i]]@Id)
##D   }
## End(Not run)



