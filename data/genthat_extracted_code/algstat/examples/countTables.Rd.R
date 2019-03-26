library(algstat)


### Name: countTables
### Title: Count Similarly Margined Contingency Tables
### Aliases: countTables

### ** Examples

## Not run: 
##D 
##D 
##D data(politics)
##D countTables(politics)
##D 
##D data(handy)
##D countTables(handy)
##D 
##D data(HairEyeColor)
##D eyeHairColor <- margin.table(HairEyeColor, 2:1)
##D countTables(eyeHairColor)
##D 
##D library(gmp)
##D as.bigz(countTables(eyeHairColor))
##D 
##D 
##D # notice that even tables with small cells can have
##D # huge fibers
##D data(drugs)
##D countTables(drugs)
##D 
##D countTables(eyeHairColor, quiet = FALSE)
##D 
##D 
##D 
## End(Not run)



