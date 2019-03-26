library(onemap)


### Name: make_seq
### Title: Create a sequence of markers
### Aliases: make_seq
### Keywords: utilities

### ** Examples


## Not run: 
##D   data(example_out)
##D   twopt <- rf_2pts(example_out)
##D 
##D   all_mark <- make_seq(twopt,"all")
##D   all_mark <- make_seq(twopt,1:30) # same as above, for this data set
##D   groups <- group(all_mark)
##D   LG1 <- make_seq(groups,1)
##D   LG1.ord <- order_seq(LG1)
##D   (LG1.final <- make_seq(LG1.ord)) # safe order
##D   (LG1.final.all <- make_seq(LG1.ord,"force")) # forced order
##D 
##D   markers <- make_seq(twopt,c(2,3,12,14))
##D   markers.comp <- compare(markers)
##D   (base.map <- make_seq(markers.comp))
##D   base.map <- make_seq(markers.comp,1,1) # same as above
##D   (extend.map <- try_seq(base.map,30))
##D   (base.map <- make_seq(extend.map,5)) # fifth position is the best
## End(Not run)




