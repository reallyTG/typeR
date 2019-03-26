library(crunch)


### Name: datasets
### Title: Get the dataset catalog
### Aliases: datasets datasets<-

### ** Examples

## Not run: 
##D # Get the primary dataset catalog
##D mydatasets <- datasets()
##D # Can load a dataset from that
##D ds <- loadDataset(mydatasets[["Dataset name"]])
##D # Can use the same function to get the dataset catalog for a project
##D proj <- projects()[["Project name"]]
##D projdatasets <- datasets(proj)
##D # The assignment method lets you move a dataset to a project
##D datasets(proj) <- ds
## End(Not run)



