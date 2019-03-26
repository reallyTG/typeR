library(fullfact)


### Name: observGlmer2
### Title: Variance components for non-normal data 2
### Aliases: observGlmer2

### ** Examples

data(chinook_survival) #Chinook salmon offspring survival
## Convert replicate-level recorded data to individual-level (binary) data
chinook_survival2<- buildBinary(dat=chinook_survival,copy=c(2:6,9),one="alive",zero="dead")
#
## Not run: 
##D survival_mod2<- observGlmer2(observ=chinook_survival2,dam="dam",sire="sire",
##D response="status",fam_link=binomial(logit),position="tray")  #a few minutes
##D survival_mod2
## End(Not run)



