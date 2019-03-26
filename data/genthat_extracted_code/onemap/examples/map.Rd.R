library(onemap)


### Name: map
### Title: Construct the linkage map for a sequence of markers
### Aliases: map
### Keywords: utilities

### ** Examples


  data(example_out)
  twopt <- rf_2pts(example_out)

  markers <- make_seq(twopt,c(30,12,3,14,2)) # correct phases
  map(markers)

  markers <- make_seq(twopt,c(30,12,3,14,2),phase=c(4,1,4,3)) # incorrect phases
  map(markers)




