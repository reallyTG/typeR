library(RSKC)


### Name: DutchUtility
### Title: Multiple Features Data Set of Robert P.W. Duin.
### Aliases: DutchUtility showDigit

### ** Examples

## Not run: 
##D 
##D data(DutchUtility)
##D 
##D truedigit <- rownames(DutchUtility)
##D (re <- RSKC(DutchUtility,ncl=10,alpha=0.1,L1=5.7,nstart=1000))
##D Sensitivity(re$labels,truedigit)
##D table(re$labels,truedigit)
##D 
##D ## Check the bitmap of the trimmed observations 
##D showDigit(re$oW[1])
##D ## Check the features which receive zero weights
##D names(which(re$weights==0))
## End(Not run)



