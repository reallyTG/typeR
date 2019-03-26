library(dtw)


### Name: warpArea
### Title: Compute Warping Path Area
### Aliases: warpArea
### Keywords: ts

### ** Examples

  ds<-dtw(1:4,1:8);

  plot(ds);lines(seq(1,8,len=4),col="red");

  warpArea(ds)

  ## Result: 6
  ##  index 2 is 2 while diag is 3.3  (+1.3)
  ##        3    3               5.7  (+2.7)
  ##        4   4:8 (avg to 6)    8   (+2  )
  ##                                 --------
  ##                                     6




