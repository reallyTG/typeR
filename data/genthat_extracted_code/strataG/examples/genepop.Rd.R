library(strataG)


### Name: genepop
### Title: Run GENEPOP
### Aliases: genepop genepopWrite

### ** Examples

## Not run: 
##D # Estimate Nm for the microsatellite data
##D data(msats.g)
##D # Run Genepop for Option 4
##D results <- genepop(msats.g, output.ext = ".PRI", other.settings = "MenuOptions=4")
##D # Locus name mapping and files
##D results
##D # Show contents of output file
##D file.show(results$files["output.fname"])
## End(Not run)




