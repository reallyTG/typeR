library(aroma.affymetrix)


### Name: QuantileNormalization
### Title: The QuantileNormalization class
### Aliases: QuantileNormalization
### Keywords: classes

### ** Examples
## Not run: 
##D   for (zzz in 0) {
##D 
##D # Setup verbose output
##D verbose <- Arguments$getVerbose(-2)
##D timestampOn(verbose)
##D 
##D # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
##D # Define an example dataset
##D # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
##D # Find any dataset
##D path <- NULL
##D if (is.null(path))
##D   break
##D 
##D ds <- AffymetrixCelSet$fromFiles(path)
##D print(ds)
##D 
##D # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
##D # Normalization
##D # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
##D norm <- QuantileNormalization(ds, subsetToAvg=1/3)
##D dsQN <- process(norm, verbose=verbose)
##D print(dsQN)
##D 
##D } # for (zzz in 0)
##D rm(zzz)
##D 
## End(Not run)


