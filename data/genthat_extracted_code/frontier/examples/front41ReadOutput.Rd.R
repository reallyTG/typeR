library(frontier)


### Name: front41ReadOutput
### Title: Read output of Frontier 4.1
### Aliases: front41ReadOutput print.front41Output
### Keywords: models

### ** Examples

   # read the output file that is provided with Frontier 4.1
   outFile <- system.file( "front41/EG1.OUT", package = "frontier" )
   sfa <- front41ReadOutput( outFile )
   print( sfa, efficiencies = TRUE )

   # perform an SFA and read the output
   data( front41Data )
   front41Data$logOutput  <- log( front41Data$output )
   front41Data$logCapital <- log( front41Data$capital )
   front41Data$logLabour  <- log( front41Data$labour )

   front41WriteInput( front41Data, "firm", yName = "logOutput",
      xNames = c( "logCapital", "logLabour" ), insFile = "coelli.ins" )

   ## Not run: 
##D    system( "front41.bin coelli.ins" )
##D    sfa <- front41ReadOutput( "coelli.out" )
##D    print( sfa )
##D    
## End(Not run)



