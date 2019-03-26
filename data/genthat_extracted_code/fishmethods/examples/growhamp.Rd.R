library(fishmethods)


### Name: growhamp
### Title: von Bertalanffy Growth Models for Tagging Data Incorporating
###   Individual Variation
### Aliases: growhamp
### Keywords: misc

### ** Examples

## Not run: 
##D ## Models 1,2 and 3 below are models 1,2, and 4 in Table 4.17 of ##Quinn and Deriso 
##D data(trout)
##D growhamp(L1=trout$L1,L2=trout$L2,TAL=trout$dt,models=c(1,2,3),
##D        method=c("Nelder-Mead","Nelder-Mead","L-BFGS-B"),
##D        varcov=c(TRUE,TRUE,TRUE),
##D        Linf=list(startLinf=650,lowerLinf=400,upperLinf=800),       
##D        K=list(startK=0.30,lowerK=0.01,upperK=1),
##D        sigma2_error=list(startsigma2=100,lowersigma2=0.1,uppersigma2=10000),
##D        sigma2_Linf=list(startsigma2=100,lowersigma2=0.1,uppersigma2=100000),	
##D        sigma2_K=list(startsigma2=0.5,lowersigma2=1e-8,uppersigma2=10))
## End(Not run)



