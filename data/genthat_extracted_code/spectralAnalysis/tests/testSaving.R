# TODO: Add comment
# 
# Author: ablommaert
###############################################################################

context( "saving and reading to JSON format is compatible  " )



## do calculations 
spectra         <-  getSpectraInTimeExample()
directory       <-  tempdir() 
saveSpectra(  spectra , directory )
experimentName  <-  getExperimentName( spectra )
file            <-  file.path( directory , paste0( experimentName , ".txt")  )
spectraRead     <-  readSpectra( file )
unlink( directory )


test_that( "read in object the same as saved object " , {
      expect_equal( str(spectra) , str( spectraRead) , info = "equal structure of object" ) 
      expect_equal( getSpectra(spectra) , getSpectra( spectraRead) , info = "equal structure of spectra" ) 
      expect_equal( spectra , spectraRead , info = "equal object" )  
    }
)

