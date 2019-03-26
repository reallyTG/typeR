library(BatchMap)


### Name: make.seq
### Title: Create a sequence of markers
### Aliases: make.seq
### Keywords: utilities

### ** Examples


## Not run: 
##D   data(example.out)
##D   twopt <- rf.2pts(example.out)
##D 
##D   all.mark <- make.seq(twopt,"all")
##D   all.mark <- make.seq(twopt,1:30) # same as above, for this data set
##D   groups <- group(all.mark)
##D   LG1 <- make.seq(groups,1)
##D   LG1.ord <- order.seq(LG1)
##D   (LG1.final <- make.seq(LG1.ord)) # safe order
##D   (LG1.final.all <- make.seq(LG1.ord,"force")) # forced order
##D 
##D   markers <- make.seq(twopt,c(2,3,12,14))
##D   markers.comp <- compare(markers)
##D   (base.map <- make.seq(markers.comp))
##D   base.map <- make.seq(markers.comp,1,1) # same as above
##D   (extend.map <- try.seq(base.map,30))
##D   (base.map <- make.seq(extend.map,5)) # fifth position is the best
## End(Not run)




