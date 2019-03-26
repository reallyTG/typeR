library(onemap)


### Name: compare
### Title: Compare all possible orders (exhaustive search) for a given
###   sequence of markers
### Aliases: compare
### Keywords: utilities

### ** Examples


## Not run: 
##D   #outcrossing example
##D   data(example_out)
##D   twopt <- rf_2pts(example_out)
##D   markers <- make_seq(twopt,c(12,14,15,26,28))
##D   (markers.comp <- compare(markers))
##D   (markers.comp <- compare(markers,verbose=TRUE))
##D 
##D   #F2 example
##D   data(onemap_example_f2)
##D   twopt <- rf_2pts(onemap_example_f2)
##D   markers <- make_seq(twopt,c(17,26,29,30,44,46,55))
##D   (markers.comp <- compare(markers))
##D   (markers.comp <- compare(markers,verbose=TRUE))
##D 
## End(Not run)





