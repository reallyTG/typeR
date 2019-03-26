library(ads)


### Name: inside.swin
### Title: Test wether points are inside a sampling window
### Aliases: inside.swin
### Keywords: spatial

### ** Examples

  data(BPoirier)
  BP <- BPoirier
  wr <- swin(BP$rect)
  sum(inside.swin(BP$trees$x, BP$trees$y, wr))
  
  wc <- swin(c(55,45,45))
  sum(inside.swin(BP$trees$x, BP$trees$y, wc))
  
  wrt <- swin(BP$rect, triangles=BP$tri1)
  sum(inside.swin(BP$trees$x, BP$trees$y,wrt))



