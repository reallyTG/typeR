library(scan)


### Name: nap
### Title: Nonoverlap of all Pairs
### Aliases: nap

### ** Examples

## Calculate NAP for a study with  lower expected phase B scores (e.g. aggressive behavior)
gretchen <- makeSCDF(c(12,14,9,10,10,6,4,5,3,4), B.start = 5)
nap(gretchen, decreasing = TRUE)

## Request NAP for all cases fom the Grosche2011 data
lapply(Grosche2011, nap)



