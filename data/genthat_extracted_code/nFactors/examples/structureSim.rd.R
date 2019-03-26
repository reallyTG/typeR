library(nFactors)


### Name: structureSim
### Title: Population or Simulated Sample Correlation Matrix from a Given
###   Factor Structure Matrix
### Aliases: structureSim
### Keywords: multivariate

### ** Examples

## Not run: 
##D # .......................................................
##D # Example inspired from Zwick and Velicer (1986, table 2, p. 437)
##D ## ...................................................................
##D  nFactors  <- 3
##D  unique    <- 0.2
##D  loadings  <- 0.5
##D  nsubjects <- 180
##D  repsim    <- 30
##D  zwick     <- generateStructure(var=36, mjc=nFactors, pmjc=12,
##D                                 loadings=loadings,
##D                                 unique=unique)
##D ## ...................................................................
##D 
##D # Produce statistics about a replication of a parallel analysis on
##D # 30 sampled correlation matrices
##D 
##D  mzwick.fa <-  structureSim(fload=as.matrix(zwick), reppar=30,
##D                             repsim=repsim, N=nsubjects, quantile=0.5,
##D                             model="factors")
##D 
##D  mzwick    <-  structureSim(fload=as.matrix(zwick), reppar=30,
##D                             repsim=repsim, N=nsubjects, quantile=0.5, all=TRUE)
##D 
##D # Very long execution time that could be used only with model="components"
##D # mzwick    <-  structureSim(fload=as.matrix(zwick), reppar=30,
##D #                            repsim=repsim, N=nsubjects, quantile=0.5, all=TRUE)
##D 
##D  par(mfrow=c(2,1))
##D  plot(x=mzwick,    nFactors=nFactors, index=c(1:14), cex.axis=0.7, col="red")
##D  plot(x=mzwick.fa, nFactors=nFactors, index=c(1:11), cex.axis=0.7, col="red")
##D  par(mfrow=c(1,1))
##D 
##D  par(mfrow=c(2,1))
##D  boxplot(x=mzwick,    nFactors=3, cex.axis=0.8, vLine="blue", col="red")
##D  boxplot(x=mzwick.fa, nFactors=3, cex.axis=0.8, vLine="blue", col="red",
##D          xlab="Components")
##D  par(mfrow=c(1,1))
##D # ......................................................
##D  
## End(Not run)
 


