library(BatchMap)


### Name: order.seq
### Title: Search for the best order of markers combining compare and
###   try.seq functions
### Aliases: order.seq
### Keywords: utilities

### ** Examples


## Not run: 
##D   #outcross example
##D   data(example.out)
##D   twopt <- rf.2pts(example.out)
##D   all.mark <- make.seq(twopt,"all")
##D   groups <- group(all.mark)
##D   LG2 <- make.seq(groups,2)
##D   LG2.ord <- order.seq(LG2,touchdown=TRUE)
##D   LG2.ord
##D   make.seq(LG2.ord) # get safe sequence
##D   make.seq(LG2.ord,"force") # get forced sequence
##D 
## End(Not run)




