library(antaresProcessing)


### Name: modulation
### Title: Compute the modulation of cluster units
### Aliases: modulation

### ** Examples

## Not run: 
##D # data required by the function
##D showAliases("modulation")
##D 
##D mydata <- readAntares(select="modulation")
##D 
##D # Modulation of cluster units
##D modulation(mydata)
##D 
##D # Aggregate Monte-Carlo scenarios
##D modulation(mydata, synthesis = TRUE)
##D 
##D # Modulation of sectors
##D modulation(mydata, by = "sector")
##D 
##D # Modulation of sectors per district
##D modulation(mydata, by = "sector")
## End(Not run)




