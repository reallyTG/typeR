library(ez)


### Name: ezMixed
### Title: Compute evidence for fixed effects in an mixed effects modelling
###   context
### Aliases: ezMixed

### ** Examples

#Read in the ANT data (see ?ANT).
data(ANT)
head(ANT)
ezPrecis(ANT)

#Run ezMixed on the accurate RT data
rt = ezMixed(
    data = ANT[ANT$error==0,]
    , dv = .(rt)
    , random = .(subnum)
    , fixed = .(cue,flank,group)
)
print(rt$summary)

## Not run: 
##D #Run ezMixed on the error rate data
##D er = ezMixed(
##D     data = ANT
##D     , dv = .(error)
##D     , random = .(subnum)
##D     , fixed = .(cue,flank,group)
##D     , family = 'binomial'
##D )
##D print(er$summary)
## End(Not run)



