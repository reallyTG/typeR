library(ads)


### Name: triangulate
### Title: Triangulate polygon
### Aliases: triangulate
### Keywords: spatial

### ** Examples

  data(BPoirier)
  BP <- BPoirier
  plot(BP$poly1$x, BP$poly1$y)
  
  # a single polygon triangulation
  tri1 <- triangulate(BP$poly1)
  plot(swin(BP$rect, tri1))
  
  # a single polygon with a hole
  #tri2 <- triangulate(c(-10,-10,120,100), BP$poly1)
  #plot(swin(c(-10,-10,120,100), tri2))
  
  # the same with narrower outer polygon
  #tri3 <- lapply(BP$poly2,triangulate)
  #tri3<-do.call(rbind,tri3)
  #xr<-range(tri3$ax,tri3$bx,tri3$cx)
  #yr<-range(tri3$ay,tri3$by,tri3$cy)
  #plot(swin(c(xr[1],yr[1],xr[2],yr[2]), tri3))
  


