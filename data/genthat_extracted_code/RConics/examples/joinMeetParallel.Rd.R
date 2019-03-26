library(RConics)


### Name: Join, meet and parallel
### Title: The join and meet of two points and the parallel
### Aliases: meet join parallel

### ** Examples

  p <- c(3,1,1)
  q <- c(0,2,1)
  l <- c(0.75,0.25,1)
  
  # m is the line passin through p and q
  m <- join(p,q)
  
  # intersection point of m and l
  ml <- meet(l,m)
  
  # line parallel to l and through p
  lp <- parallel(p,l)
  
  # plot
  plot(rbind(p,q),xlim=c(-5,5),ylim=c(-5,5))
  abline(h=0,v=0,col="grey",lty=3)
  addLine(l,col="red")
  addLine(m,col="blue")
  points(t(ml),cex=1.5,pch=20,col="blue")
  addLine(lp,col="green")
  



