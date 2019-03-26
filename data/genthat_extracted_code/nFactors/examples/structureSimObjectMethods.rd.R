library(nFactors)


### Name: structureSimObjectMethods
### Title: Utility Functions for nScree Class Objects
### Aliases: boxplot.structureSim is.structureSim plot.structureSim
###   print.structureSim summary.structureSim
### Keywords: multivariate

### ** Examples

## Not run: 
##D ## INITIALISATION
##D  library(xtable)
##D  library(nFactors)
##D  nFactors  <- 3
##D  unique    <- 0.2
##D  loadings  <- 0.5
##D  nsubjects <- 180
##D  repsim    <- 10
##D  var       <- 36
##D  pmjc      <- 12
##D  reppar    <- 10
##D  zwick     <- generateStructure(var=var, mjc=nFactors, pmjc=pmjc,
##D                                 loadings=loadings,
##D                                 unique=unique)
##D 
##D ## SIMULATIONS
##D mzwick    <-  structureSim(fload=as.matrix(zwick), reppar=reppar,
##D                            repsim=repsim, details=TRUE,
##D                            N=nsubjects, quantile=0.5)
##D 
##D ## TEST OF structureSim METHODS
##D  is(mzwick)
##D  summary(mzwick, index=1:5, eigenSelect=1:10, digits=3)
##D  print(mzwick, index=1:10)
##D  plot(x=mzwick, index=c(1:10), cex.axis=0.7, col="red")
##D  boxplot(x=mzwick, nFactors=3, vLine="blue", col="red")
##D  
## End(Not run)
 


