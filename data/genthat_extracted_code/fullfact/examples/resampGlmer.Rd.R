library(fullfact)


### Name: resampGlmer
### Title: Bootstrap components for non-normal data
### Aliases: resampGlmer

### ** Examples

data(chinook_resampS) #5 iterations

## Not run: 
##D survival_rcomp<- resampGlmer(resamp=survival_datR,dam="dam",sire="sire",
##D response="status",fam_link=binomial(logit),start=1,end=1000)
## End(Not run)



