library(BatchMap)


### Name: seeded.map
### Title: Construct the linkage map for a sequence of markers after
###   seeding phases
### Aliases: seeded.map
### Keywords: utilities

### ** Examples


  data(example.out)
  twopt <- rf.2pts(example.out)

  markers <- make.seq(twopt,c(30,12,3,14,2))
  seeded.map(markers, seeds = c(4,2))





