library(onemap)


### Name: order_seq
### Title: Search for the best order of markers combining compare and
###   try_seq functions
### Aliases: order_seq
### Keywords: utilities

### ** Examples


## Not run: 
##D   #outcross example
##D   data(example_out)
##D   twopt <- rf_2pts(example_out)
##D   all_mark <- make_seq(twopt,"all")
##D   groups <- group(all_mark)
##D   LG2 <- make_seq(groups,2)
##D   LG2.ord <- order_seq(LG2,touchdown=TRUE)
##D   LG2.ord
##D   make_seq(LG2.ord) # get safe sequence
##D   make_seq(LG2.ord,"force") # get forced sequence
##D 
##D   #F2 example
##D   data(onemap_example_f2)
##D   twopt <- rf_2pts(onemap_example_f2)
##D   all_mark <- make_seq(twopt,"all")
##D   groups <- group(all_mark)
##D   LG3 <- make_seq(groups,3)
##D   LG3.ord <- order_seq(LG3, subset.search = "twopt", twopt.alg = "rcd", touchdown=TRUE)
##D   LG3.ord
##D   make_seq(LG3.ord) # get safe sequence
##D   ord.1<-make_seq(LG3.ord,"force") # get forced sequence
##D 
##D   LG3.ord.s <- order_seq(LG3, subset.search = "sample", touchdown=TRUE)
##D   LG3.ord.s
##D   make_seq(LG3.ord) # get safe sequence
##D   ord.2<-make_seq(LG3.ord,"force") # get forced sequence
##D 
##D   rbind(ord.1$seq.num, ord.2$seq.num) # probably, the same order for
##D   this dataset
## End(Not run)




