library(onemap)


### Name: ripple_seq
### Title: Compares and displays plausible alternative orders for a given
###   linkage group
### Aliases: ripple_seq
### Keywords: utilities

### ** Examples


## Not run: 
##D  #Outcross example
##D   data(example_out)
##D   twopt <- rf_2pts(example_out)
##D   markers <- make_seq(twopt,c(27,16,20,4,19,21,23,9,24,29))
##D   markers.map <- map(markers)
##D   ripple_seq(markers.map)
##D 
##D #F2 example
##D  data(onemap_example_f2)
##D  twopt <- rf_2pts(onemap_example_f2)
##D  all_mark <- make_seq(twopt,"all")
##D  groups <- group(all_mark)
##D  LG3 <- make_seq(groups,3)
##D  LG3.ord <- order_seq(LG3, subset.search = "twopt", twopt.alg = "rcd", touchdown=TRUE)
##D  LG3.ord
##D  make_seq(LG3.ord) # get safe sequence
##D  ord.1<-make_seq(LG3.ord,"force") # get forced sequence
##D  ripple_seq(ord.1, ws=5)
## End(Not run)





