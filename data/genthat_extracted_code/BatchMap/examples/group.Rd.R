library(BatchMap)


### Name: group
### Title: Assign markers to linkage groups
### Aliases: group
### Keywords: misc

### ** Examples


  data(example.out)
  twopts <- rf.2pts(example.out)

  all.data <- make.seq(twopts,"all")
  link_gr <- group(all.data)
  link_gr
  print(link_gr, details=FALSE) #omit the names of the markers




