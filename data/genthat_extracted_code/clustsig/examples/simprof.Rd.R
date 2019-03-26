library(clustsig)


### Name: simprof
### Title: Similiarity Profile Analysis
### Aliases: simprof
### Keywords: cluster similarity profile significant cluster cluster
###   analysis

### ** Examples

## Not run: 
##D # Load the USArrests dataset included with R
##D # And use abbreviations of state names
##D # We leave out the third column because
##D # it is on a different scale
##D usarrests<-USArrests[,c(1,2,4)]
##D rownames(usarrests)<-state.abb
##D # Run simprof on the data
##D res <- simprof(data=usarrests, 
##D method.distance="braycurtis")
##D # Graph the result
##D pl.color <- simprof.plot(res)
## End(Not run)



