library(onemap)


### Name: group
### Title: Assign markers to linkage groups
### Aliases: group
### Keywords: misc

### ** Examples


  data(example_out)
  twopts <- rf_2pts(example_out)

  all.data <- make_seq(twopts,"all")
  link_gr <- group(all.data)
  link_gr
  print(link_gr, details=FALSE) #omit the names of the markers




