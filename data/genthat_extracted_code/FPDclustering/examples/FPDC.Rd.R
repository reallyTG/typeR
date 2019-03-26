library(FPDclustering)


### Name: FPDC
### Title: Factor probabilistic distance clustering
### Aliases: FPDC

### ** Examples

## Not run: 
##D # Asymmetric data set clustering example (with shape=3).
##D data('asymmetric3')
##D x<-asymmetric3[,-1]
##D fpdas3=FPDC(x,4,3,3)
##D table(asymmetric3[,1],fpdas3$label)
##D Silh(fpdas3$probability)
## End(Not run)

## Not run: 
##D # Asymmetric data set clustering example (with shape=20).
##D data('asymmetric20')
##D x<-asymmetric20[,-1]
##D fpdas20=FPDC(x,4,3,3)
##D table(asymmetric20[,1],fpdas20$label)
##D Silh(fpdas20$probability)
## End(Not run)

## Not run: 
##D # Clustering example with outliers.
##D data('outliers')
##D x<-outliers[,-1]
##D fpdout=FPDC(x,4,5,4)
##D table(outliers[,1],fpdout$label)
##D Silh(fpdout$probability)
## End(Not run)



