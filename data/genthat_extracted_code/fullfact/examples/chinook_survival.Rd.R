library(fullfact)


### Name: chinook_survival
### Title: Chinook salmon survival, raw data
### Aliases: chinook_survival
### Keywords: datasets

### ** Examples

data(chinook_survival)
## Convert replicate-level recorded data to individual-level (binary) data
chinook_survival2<- buildBinary(dat=chinook_survival,copy=c(2:6,9),one="alive",zero="dead")

## Standard additive genetic, non-additive genetic, and maternal variance analysis
## Not run: 
##D survival_mod1<- observGlmer(observ=chinook_survival2,dam="dam",sire="sire",
##D response="status",fam_link=binomial(logit))
##D survival_mod1
## End(Not run)



