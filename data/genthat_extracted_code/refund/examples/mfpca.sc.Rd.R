library(refund)


### Name: mfpca.sc
### Title: Multilevel functional principal components analysis by smoothed
###   covariance
### Aliases: mfpca.sc

### ** Examples

 ## Not run: 
##D  data(DTI)
##D  DTI = subset(DTI, Nscans < 6)  ## example where all subjects have 6 or fewer visits
##D  id  = DTI$ID
##D  Y = DTI$cca
##D  mfpca.DTI =  mfpca.sc(Y=Y, id = id, twoway = TRUE)
##D  
## End(Not run)



