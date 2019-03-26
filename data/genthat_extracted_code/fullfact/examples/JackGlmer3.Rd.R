library(fullfact)


### Name: JackGlmer3
### Title: Jackknife components for non-normal data 3
### Aliases: JackGlmer3

### ** Examples

data(chinook_survival) #Chinook salmon offspring survival
## Convert replicate-level recorded data to individual-level (binary) data
chinook_survival2<- buildBinary(dat=chinook_survival,copy=c(1:6,9),one="alive",zero="dead")

#Delete-one
## Not run: 
##D survival_jack3<- JackGlmer3(observ=chinook_survival2,dam="dam",sire="sire",
##D response="status",fam_link=binomial(logit),remain="egg_size + (1|tray)")
## End(Not run)

#Delete-d, d=36
## Not run: 
##D survival_jack3.2<- JackGlmer3(observ=chinook_survival2,dam="dam",sire="sire",
##D response="status",fam_link=binomial(logit),remain="egg_size + (1|tray)",size=36)
## End(Not run)



