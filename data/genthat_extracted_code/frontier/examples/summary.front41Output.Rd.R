library(frontier)


### Name: summary.front41Output
### Title: Summarizing the Estimation of Frontier 4.1
### Aliases: summary.front41Output print.summary.front41Output
### Keywords: models

### ** Examples

   # read the output file that is provided with Frontier 4.1
   outFile <- system.file( "front41/EG1.OUT", package = "frontier" )
   sfa <- front41ReadOutput( outFile )
   summary( sfa )



