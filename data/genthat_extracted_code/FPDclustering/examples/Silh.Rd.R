library(FPDclustering)


### Name: Silh
### Title: Probabilistic silhouette plot
### Aliases: Silh

### ** Examples

## Not run: 
##D # Asymmetric data set silhouette example (with shape=3).
##D data('asymmetric3')
##D x<-asymmetric3[,-1]
##D fpdas3=FPDC(x,4,3,3)
##D Silh(fpdas3$probability)
## End(Not run)

## Not run: 
##D # Asymmetric data set shiluette example (with shape=20).
##D data('asymmetric20')
##D x<-asymmetric20[,-1]
##D fpdas20=FPDC(x,4,3,3)
##D Silh(fpdas20$probability)
## End(Not run)

## Not run: 
##D # Shiluette example with outliers.
##D data('outliers')
##D x<-outliers[,-1]
##D fpdout=FPDC(x,4,4,3)
##D Silh(fpdout$probability)
## End(Not run)



