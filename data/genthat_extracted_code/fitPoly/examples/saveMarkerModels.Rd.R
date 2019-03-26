library(fitPoly)


### Name: saveMarkerModels
### Title: Function to fit mixture models for series of markers and save
###   the results to files
### Aliases: saveMarkerModels

### ** Examples

## No test: 
 # These examples run for a total of about 55 sec.
 # All output files are saved in tempdir() and subdirectories of it.

 data(fitPoly_data)

 # tetraploid, with no populations and with sample prior dosages
 saveMarkerModels(ploidy=4, data=fitPoly_data$ploidy4$dat4x,
                  samplePriors=fitPoly_data$ploidy4$sampPriors4x,
                  filePrefix=paste0(tempdir(),"/4xA"),
                  allModelsFile=TRUE,
                  plot="fitted")

 # tetraploid, with specified populations and parental and sample prior dosages
 saveMarkerModels(ploidy=4, data=fitPoly_data$ploidy4$dat4x,
                  population=fitPoly_data$ploidy4$pop4x,
                  pop.parents=fitPoly_data$ploidy4$pop.par4x,
                  parentalPriors=fitPoly_data$ploidy4$parPriors4x,
                  samplePriors=fitPoly_data$ploidy4$sampPriors4x,
                  filePrefix=paste0(tempdir(),"/4xB"),
                  allModelsFile=TRUE,
                  plot="fitted")

 # hexaploid, no populations or prior information
 saveMarkerModels(ploidy=6, data=fitPoly_data$ploidy6$dat6x,
                  filePrefix=paste0(tempdir(),"/6xA"),
                  allModelsFile=TRUE,
                  plot="fitted")

 # hexaploid, with specified populations, prior dosages of parents and other samples
 # and prior means of the mixture components
 saveMarkerModels(ploidy=6, data=fitPoly_data$ploidy6$dat6x,
                  population=fitPoly_data$ploidy6$pop6x,
                  pop.parents=fitPoly_data$ploidy6$pop.par6x,
                  startmeans=fitPoly_data$ploidy6$startmeans6x,
                  parentalPriors=fitPoly_data$ploidy6$parPriors6x,
                  samplePriors=fitPoly_data$ploidy6$sampPriors6x,
                  filePrefix=paste0(tempdir(),"/6xB"),
                  plot="fitted")
## End(No test)




