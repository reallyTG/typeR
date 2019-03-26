library(onemap)


### Name: rf_2pts
### Title: Two-point analysis between genetic markers
### Aliases: rf_2pts
### Keywords: utilities

### ** Examples


  data(example_out)

  twopts <- rf_2pts(example_out,LOD=3,max.rf=0.5) # perform two-point analyses
  twopts

  print(twopts,c("M1","M2")) # detailed results for markers 1 and 2




