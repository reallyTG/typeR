library(BatchMap)


### Name: map
### Title: Construct the linkage map for a sequence of markers
### Aliases: map
### Keywords: utilities

### ** Examples


  data(example.out)
  twopt <- rf.2pts(example.out)

  markers <- make.seq(twopt,c(30,12,3,14,2)) # correct phases
  map(markers)

  markers <- make.seq(twopt,c(30,12,3,14,2),phase=c(4,1,4,3)) # incorrect phases
  map(markers)




