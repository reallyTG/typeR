library(RATest)


### Name: RDperm
### Title: Regression Discontinuity Design Permutation Test
### Aliases: RDperm
### Keywords: permutation rdperm test

### ** Examples

permtest<-RDperm(W=c("demshareprev"),z="difdemshare",data=lee2008)
summary(permtest)
## Not run: 
##D permtest<-RDperm(W=c("demshareprev","demwinprev"),z="difdemshare",data=lee2008)
##D summary(permtest)
## End(Not run)



