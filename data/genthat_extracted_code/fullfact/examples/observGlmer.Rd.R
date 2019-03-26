library(fullfact)


### Name: observGlmer
### Title: Variance components for non-normal data
### Aliases: observGlmer

### ** Examples

data(chinook_survival) #Chinook salmon offspring survival
## Convert replicate-level recorded data to individual-level (binary) data
chinook_survival2<- buildBinary(dat=chinook_survival,copy=c(2:6,9),one="alive",zero="dead")
#
## Not run: 
##D survival_mod1<- observGlmer(observ=chinook_survival2,dam="dam",sire="sire",
##D response="status",fam_link=binomial(logit))  #a few minutes
##D survival_mod1
## End(Not run)



