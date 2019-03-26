library(frontier)


### Name: front41Est
### Title: Estimate a Stochastic Frontier Model by Frontier 4.1
### Aliases: front41Est
### Keywords: models

### ** Examples

   data( front41Data )
   front41Data$logOutput  <- log( front41Data$output )
   front41Data$logCapital <- log( front41Data$capital )
   front41Data$logLabour  <- log( front41Data$labour )

   ## Not run: 
##D    front41Est( data = front41Data, crossSectionName = "firm",
##D       yName = "logOutput", xNames = c( "logCapital", "logLabour" ) )
##D    
## End(Not run)



