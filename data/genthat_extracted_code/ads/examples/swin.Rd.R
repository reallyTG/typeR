library(ads)


### Name: swin
### Title: Creating a sampling window
### Aliases: swin print.swin summary.swin print.summary.swin plot.swin
###   owin2swin
### Keywords: spatial

### ** Examples

  #rectangle of size [0,110] x [0,90]
  wr <- swin(c(0,0,110,90))
  summary(wr)
  plot(wr)
  
  #circle with radius 50 centred on (55,45)
  wc <- swin(c(55,45,50))
  summary(wc)
  plot(wc)
  
 # polygon (diamond shape)
 t1 <- c(0,0,55,0,0,45)
 t2 <- c(55,0,110,0,110,45)
 t3 <- c(0,45,0,90,55,90)
 t4 <- c(55,90,110,90,110,45)
 wp <- swin(wr, rbind(t1,t2,t3,t4))
 summary(wp)
 plot(wp)
 
 #rectangle with a hole
 h1 <- c(25,45,55,75,85,45)
 h2 <- c(25,45,55,15,85,45)
 wrh <- swin(wr, rbind(h1,h2))
 summary(wrh)
 plot(wrh)

 #circle with a hole
 wch <- swin(wc, rbind(h1,h2))
 summary(wch)
 plot(wch)
 
 #converting an owin object from spatstat
 data(demopat)
 demo.swin<-owin2swin(demopat$window)
 plot(demo.swin)



