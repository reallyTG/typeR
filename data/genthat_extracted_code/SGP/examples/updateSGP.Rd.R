library(SGP)


### Name: updateSGP
### Title: Function to update SGP object with additional year's analyses
### Aliases: updateSGP
### Keywords: documentation

### ** Examples

## Not run: 
##D ### Run analyses on all but final year's of data
##D 
##D Demonstration_Data_LONG <- subset(sgpData_LONG, YEAR ##D 
##D Demonstration_Data_LONG_2013_2014 <- subset(sgpData_LONG, YEAR ##D 
##D 
##D Demonstration_SGP <- abcSGP(
##D         sgp_object=Demonstration_Data_LONG,
##D         sgPlot.demo.report=TRUE)
##D 
##D 
##D ### Run updateSGP on Demonstration_SGP and the 2013_2014 data
##D 
##D Demonstration_SGP <- updateSGP(
##D         what_sgp_object=Demonstration_SGP,
##D         with_sgp_data_LONG=Demonstration_Data_LONG_2013_2014)
## End(Not run)



