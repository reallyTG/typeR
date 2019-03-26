library(ktspair)


### Name: ktspcalc
### Title: Compute the k top scoring pairs based on a gene expression
###   matrix and a group indicator vector.
### Aliases: ktspcalc
### Keywords: misc

### ** Examples

  ## Not run: 
##D   ## Load data
##D   data(ktspdata) 
##D   ktsp <- ktscalc(dat,grp,3)
##D   ktsp <- ktspcalc(eSet,grp,3)
##D   ktsp <- ktspcalc(eSet,1,3)
##D   ktsp
##D   ktsp$rankscore
##D   ktsp$accuracy_k
##D   ktsp$accuracy
##D 
##D   ktsp2 <- ktspcalc(dat, grp, 9)
##D   ktsp2
##D   ktsp2 <- ktspcalc(dat, grp, 9, length=40)
##D   ktsp2
##D  
## End(Not run)



