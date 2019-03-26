library(BatchMap)


### Name: rf.2pts
### Title: Two-point analysis between genetic markers
### Aliases: rf.2pts
### Keywords: utilities

### ** Examples


  data(example.out)

  twopts <- rf.2pts(example.out,LOD=3,max.rf=0.5) # perform two-point analyses
  twopts

  print(twopts,c("M1","M2")) # detailed results for markers 1 and 2




