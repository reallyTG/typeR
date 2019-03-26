library(FactorsR)


### Name: Factors
### Title: Identification of the factors affecting species richness
### Aliases: Factors
### Keywords: Factors

### ** Examples

## Not run: 
##D 
##D data(Sharks)
##D data(adworld)
##D 
##D Factors(data = Sharks, varY = "Species.Richness", varX = c("AOO.Index",
##D "Bathymetry","Nitrate","Salinity","Temperature"), outliers=TRUE, stepwise=TRUE,
##D indlog = TRUE, threshold=12)
##D 
##D #Remove the data set
##D rm(Sharks)
##D rm(adworld)
## End(Not run)



