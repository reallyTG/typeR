library(onemap)


### Name: marker_type
### Title: Informs the segregation patterns of markers
### Aliases: marker_type
### Keywords: manip utilities

### ** Examples


  data(example_out)
  twopts <- rf_2pts(example_out)
  markers.ex <- make_seq(twopts,c(3,6,8,12,16,25))
  marker_type(markers.ex) # segregation type for some markers

  data(onemap_example_f2)
  twopts <- rf_2pts(onemap_example_f2)
  all_mrk<-make_seq(twopts, "all")
  lgs<-group(all_mrk)
  lg1<-make_seq(lgs,1)
  marker_type(lg1) # segregation type for linkage group 1





