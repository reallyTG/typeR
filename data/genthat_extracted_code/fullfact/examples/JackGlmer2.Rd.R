library(fullfact)


### Name: JackGlmer2
### Title: Jackknife components for non-normal data 2
### Aliases: JackGlmer2

### ** Examples

data(chinook_survival) #Chinook salmon offspring survival
## Convert replicate-level recorded data to individual-level (binary) data
chinook_survival2<- buildBinary(dat=chinook_survival,copy=c(1:6,9),one="alive",zero="dead")

#Delete-one
## Not run: 
##D survival_jack2<- JackGlmer2(observ=chinook_survival2,dam="dam",sire="sire",
##D response="status",fam_link=binomial(logit),position="tray")
## End(Not run)

#Delete-d, d=36
## Not run: 
##D survival_jack2.2<- JackGlmer2(observ=chinook_survival2,dam="dam",sire="sire",
##D response="status",fam_link=binomial(logit),position="tray",size=36)
## End(Not run)




