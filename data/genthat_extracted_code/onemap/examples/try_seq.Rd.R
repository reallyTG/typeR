library(onemap)


### Name: try_seq
### Title: Try to map a marker into every possible position between markers
###   in a given map
### Aliases: try_seq
### Keywords: utilities

### ** Examples


## Not run: 
##D   #outcrossing example
##D   data(example_out)
##D   twopt <- rf_2pts(example_out)
##D   markers <- make_seq(twopt,c(2,3,12,14))
##D   markers.comp <- compare(markers)
##D   base.map <- make_seq(markers.comp,1)
##D 
##D   extend.map <- try_seq(base.map,30)
##D   extend.map
##D   print(extend.map,5) # best position
##D   print(extend.map,4) # second best position
##D 
##D   #F2 example
##D   data(mapmaker_example_f2)
##D   twopt <- rf_2pts(mapmaker_example_f2)
##D   all_mark <- make_seq(twopt,"all")
##D   groups <- group(all_mark)
##D   LG3 <- make_seq(groups,3)
##D   LG3.ord <- order_seq(LG3, subset.search = "twopt", twopt.alg = "rcd", touchdown=TRUE)
##D   LG3.ord
##D   safe.map<-make_seq(LG3.ord,"safe")
##D   extend.map <- try_seq(safe.map,64)
##D   extend.map
##D   (new.map<-make_seq(extend.map,14)) # best position
## End(Not run)




