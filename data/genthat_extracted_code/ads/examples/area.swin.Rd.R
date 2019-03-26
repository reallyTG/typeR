library(ads)


### Name: area.swin
### Title: Area of a sampling window
### Aliases: area.swin
### Keywords: spatial

### ** Examples

  #rectangle of size [0,110] x [0,90]
  wr<-swin(c(0,0,110,90))
  area.swin(wr)
  
  #circle with radius 50 centred on (55,45)
  wc<-swin(c(55,45,50))
  area.swin(wc)
  
 # polygon (diamond shape)
 t1 <- c(0,0,55,0,0,45)
 t2 <- c(55,0,110,0,110,45)
 t3 <- c(0,45,0,90,55,90)
 t4 <- c(55,90,110,90,110,45)
 wp <- swin(wr, rbind(t1,t2,t3,t4))
 area.swin(wp)



