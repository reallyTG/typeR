library(frontier)


### Name: elas.frontierQuad
### Title: Elasticities of a Quadratic/Translog Frontier
### Aliases: elas.frontierQuad
### Keywords: models

### ** Examples

   # example included in FRONTIER 4.1 (cross-section data)
   data( front41Data )
   front41Data$logOutput  <- log( front41Data$output )
   front41Data$logCapital <- log( front41Data$capital )
   front41Data$logLabour  <- log( front41Data$labour )

   translog <- frontierQuad( yName = "logOutput",
      xNames = c( "logCapital", "logLabour" ),
      data = front41Data )
   elas( translog )



