library(rYoutheria)


### Name: getMeasurementData
### Title: Get a table of trait measurements from YouTheria
### Aliases: getMeasurementData

### ** Examples


## Not run: 
##D # Select measurement type by id
##D M14 <- getMeasurementData(14)
##D M22_7_2 <- getMeasurementData(c(22,7,2))
##D 
##D # Select measurement type by name
##D WM <- getMeasurementData('Wing Morphology')
##D WM_TN <- getMeasurementData(c('Wing Morphology','Teat Number'))
##D 
##D # Select by measurement type and species name
##D PpPr_bodymass <- getMeasurementData(measurementType = 1,
##D                                     MSW93Binomial = c('Pongo pygmaeus','Peroryctes raffrayana'))
##D                    
##D #Select by measurement type, species name and location
##D Ob_Activity_Tanz <- getMeasurementData(measurementType = 'Activity Cycle',
##D                                        MSW05Binomial = 'Oryx beisa',
##D                                        country = 'Tanzania')
## End(Not run)



