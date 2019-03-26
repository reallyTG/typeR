library(BatchMap)


### Name: try.seq
### Title: Try to map a marker into every possible position between markers
###   in a given map
### Aliases: try.seq
### Keywords: utilities

### ** Examples


## Not run: 
##D   #outcrossing example
##D   data(example.out)
##D   twopt <- rf.2pts(example.out)
##D   markers <- make.seq(twopt,c(2,3,12,14))
##D   markers.comp <- compare(markers)
##D   base.map <- make.seq(markers.comp,1)
##D 
##D   extend.map <- try.seq(base.map,30)
##D   extend.map
##D   print(extend.map,5) # best position
##D   print(extend.map,4) # second best position
##D 
## End(Not run)




