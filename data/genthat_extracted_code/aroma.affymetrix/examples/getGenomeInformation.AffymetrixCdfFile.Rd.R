library(aroma.affymetrix)


### Name: getGenomeInformation.AffymetrixCdfFile
### Title: Gets genome information for this chip type
### Aliases: getGenomeInformation.AffymetrixCdfFile
###   AffymetrixCdfFile.getGenomeInformation
###   getGenomeInformation,AffymetrixCdfFile-method
### Keywords: internal methods IO

### ** Examples
## Not run: 
##D  
##D for (zzz in 0) {
##D 
##D # Define a CDF for a SNP chip
##D if (!exists("cdf")) {
##D   cdf <- AffymetrixCdfFile$fromChipType(".*Sty.*")
##D }
##D print(cdf)
##D 
##D # Get the genome information
##D gi <- getGenomeInformation(cdf)
##D print(gi)
##D 
##D # Get the units on chromosome X order position by default
##D # (First call will be slow be data is being cached)
##D units <- getUnitIndices(gi, chromosome="X")
##D nunits <- length(units)
##D cat(sprintf("Number of units on chromosome X: %d\n", nunits))
##D str(units)
##D 
##D # Plot the SNP density for this chromosome
##D plotDensity(gi, chromosome="X")
##D 
##D } # for (zzz in 0)
##D rm(zzz)
##D 
## End(Not run)


