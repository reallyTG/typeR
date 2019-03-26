library(frontier)


### Name: frontierQuad
### Title: Quadratic or Translog Frontiers
### Aliases: frontierQuad
### Keywords: models

### ** Examples

   # example included in FRONTIER 4.1 (cross-section data)
   data( front41Data )
   front41Data$logOutput  <- log( front41Data$output )
   front41Data$logCapital <- log( front41Data$capital )
   front41Data$logLabour  <- log( front41Data$labour )

   # estimate the translog function
   translog <- frontierQuad( yName = "logOutput",
      xNames = c( "logCapital", "logLabour" ),
      data = front41Data )
   translog

   # estimate the same model using sfa()
   translog2 <- sfa( logOutput ~ logCapital + logLabour
      + I( 0.5 * logCapital^2 ) + I( logCapital * logLabour )
      + I( 0.5 * logLabour^2 ), data = front41Data )
   translog2
   all.equal( coef( translog ), coef( translog2 ),
      check.attributes = FALSE )



