library(spectralAnalysis)


### Name: saveSpectra
### Title: save a 'SpectraInTime-class' as a '.txt' file
### Aliases: saveSpectra readSpectra save read readSpectra

### ** Examples

  ## Don't show: 
 directory       <-  tempdir() 
## End(Don't show) 
  spectra         <-  getSpectraInTimeExample()
 saveSpectra(  spectra , directory )
 experimentName  <-  getExperimentName( spectra )
 file            <-  file.path( directory , paste0( experimentName , ".txt")  )
 spectraRead     <-  readSpectra( file )
 ## Don't show: 
 unlink( directory ) 
## End(Don't show)



