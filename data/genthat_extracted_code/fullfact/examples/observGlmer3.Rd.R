library(fullfact)


### Name: observGlmer3
### Title: Variance components for non-normal data 3
### Aliases: observGlmer3

### ** Examples

data(chinook_survival) #Chinook salmon offspring survival
## Convert replicate-level recorded data to individual-level (binary) data
chinook_survival2<- buildBinary(dat=chinook_survival,copy=c(2:6,9),one="alive",zero="dead")
#just a few iterations for the p-value of fixed effect
## Not run: 
##D survival_mod3<- observGlmer3(observ=chinook_survival2,dam="dam",sire="sire",
##D response="status",fam_link=binomial(logit),remain="egg_size + (1|tray)",iter=5)
##D 
##D survival_mod3
## End(Not run)



