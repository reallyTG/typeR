library(onemap)


### Name: seriation
### Title: Seriation
### Aliases: seriation
### Keywords: utilities

### ** Examples


## Not run: 
##D   ##outcross example
##D   data(example_out)
##D   twopt <- rf_2pts(example_out)
##D   all_mark <- make_seq(twopt,"all")
##D   groups <- group(all_mark)
##D   LG3 <- make_seq(groups,3)
##D   LG3.ser <- seriation(LG3)
##D 
##D   ##F2 example
##D   data(onemap_example_f2)
##D   twopt <- rf_2pts(onemap_example_f2)
##D   all_mark <- make_seq(twopt,"all")
##D   groups <- group(all_mark)
##D   LG1 <- make_seq(groups,1)
##D   LG1.ser <- seriation(LG1)
##D   LG1.ser
## End(Not run)




