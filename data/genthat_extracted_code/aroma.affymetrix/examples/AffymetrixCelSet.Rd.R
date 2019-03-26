library(aroma.affymetrix)


### Name: AffymetrixCelSet
### Title: The AffymetrixCelSet class
### Aliases: AffymetrixCelSet
### Keywords: classes

### ** Examples
## Not run: 
##D   for (zzz in 0) {
##D 
##D # Find any dataset
##D path <- NULL
##D if (is.null(path))
##D   break
##D 
##D # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
##D # Define a dataset object based on all CEL files in a directory
##D # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
##D ds <- AffymetrixCelSet$fromFiles(path)
##D print(ds)
##D 
##D # Keep at most three arrays for this example
##D ds <- ds[1:min(3,nbrOfArrays(ds))]
##D print(ds)
##D 
##D } # for (zzz in 0)
##D rm(zzz)
##D 
## End(Not run)


