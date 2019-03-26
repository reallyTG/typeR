library(lmomRFA)


### Name: regtst
### Title: Test statistics for regional frequency analysis
### Aliases: regtst regtst.s print.regtst
### Keywords: misc

### ** Examples

# An example from Hosking (1996).  Compare the output with
# the file 'cascades.out' in the LMOMENTS Fortran package at
# http://lib.stat.cmu.edu/lmoments/general (results will not
# be identical, because random-number generators are different).
summary(regtst(Cascades, nsim=500))

# Output from 'regsamlmu' can be fed straight into 'regtst'
regtst(regsamlmu(Maxwind))



