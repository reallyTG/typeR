library(frontier)


### Name: front41WriteInput
### Title: Write input files for Frontier 4.1
### Aliases: front41WriteInput
### Keywords: models

### ** Examples

   data( front41Data )
   front41Data$logOutput  <- log( front41Data$output )
   front41Data$logCapital <- log( front41Data$capital )
   front41Data$logLabour  <- log( front41Data$labour )

   front41WriteInput( front41Data, "firm", yName = "logOutput",
      xNames = c( "logCapital", "logLabour" ), insFile = "coelli.ins" )

   ## Not run: 
##D    system( "front41.bin coelli.ins" )
##D    sfa <- front41ReadOutput( "coelli.out" )
##D    
## End(Not run)



