library(ez)


### Name: ezMixedProgress
### Title: Retrieve information saved to file by a call to ezMixed
### Aliases: ezMixedProgress

### ** Examples

## Not run: 
##D #Read in the ANT data (see ?ANT).
##D data(ANT)
##D head(ANT)
##D ezPrecis(ANT)
##D 
##D #Run ezMixed on the accurate RT data
##D rt_mix = ezMixed(
##D     data = ANT[ANT$error==0,]
##D     , dv = .(rt)
##D     , random = .(subnum)
##D     , fixed = .(cue,flank,group)
##D     , progress_dir = 'rt_mix'
##D )
##D 
##D rt_mix = ezMixedProgress('rt_mix')
##D print(rt_mix$summary)
## End(Not run)




