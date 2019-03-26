library(fullfact)


### Name: resampGlmer3
### Title: Bootstrap components for non-normal data 3
### Aliases: resampGlmer3

### ** Examples

data(chinook_resampS) #5 iterations

## Not run: 
##D survival_rcomp3<- resampGlmer3(resamp=survival_datR,dam="dam",sire="sire",
##D response="status",fam_link=binomial(logit),start=1,end=1000,
##D remain="egg_size# + (1|tray#)")
## End(Not run)




