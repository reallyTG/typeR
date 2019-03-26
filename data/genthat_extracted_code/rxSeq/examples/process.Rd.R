library(rxSeq)


### Name: process
### Title: Optimization wrapper, maximizing either the joint model of total
###   (TReC) and allele specific (ASE) counts or just TReC
### Aliases: process
### Keywords: methods

### ** Examples
## Not run: 
##D # fitting X chromosome data example, for a full model, i.e. assuming we have allele specific reads:
##D trecase.A.out = process(rc=rcA)
##D names(trecase.A.out)
##D trecase.A.out$pval
##D 
##D #alternatively for X chromosome:
##D trecase.X.out = process(rc=rcX)
##D names(trecase.X.out)
##D trecase.X.out$pval
## End(Not run)


