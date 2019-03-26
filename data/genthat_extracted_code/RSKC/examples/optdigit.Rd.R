library(RSKC)


### Name: optd
### Title: Optical Recognition of Handwritten Digits of Frank A, Asuncion A
###   (2010).
### Aliases: optd bitmapLab bitmapMat showbitmap

### ** Examples

## Not run: 
##D 
##D data(optd)
##D 
##D truedigit <- rownames(optd)
##D (re <- RSKC(optd,ncl=10,alpha=0.1,L1=5.7,nstart=1000))
##D Sensitivity(re$labels,truedigit)
##D table(re$labels,truedigit)
##D 
##D ## Check the bitmap of the trimmed observations 
##D showbitmap(re$oW)
##D ## Check the features which receive zero weights
##D names(which(re$weights==0))
## End(Not run)



