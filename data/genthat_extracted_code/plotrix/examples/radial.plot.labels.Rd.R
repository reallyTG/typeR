library(plotrix)


### Name: radial.plot.labels
### Title: Display labels on a circular grid
### Aliases: radial.plot.labels
### Keywords: misc

### ** Examples

 testlen<-c(rnorm(10)*2+5)
 # do the labels in clock24 units
 testpos<-c(6.74,8.3,10.55,12.33,13.75,15.9,17.15,19.36,21.02,23.27)
 oldpar<-clock24.plot(testlen,testpos,main="Test radial.plot.labels",
  rp.type="s",point.symbols=3,point.col="blue")
 radial.plot.labels(testlen,testpos,units="clock24",labels=LETTERS[1:10],
  pos=3,col="blue")
 testangle<-c(25,42,67,94,128,173,191,234,268,307)
 # now a polar plot
 polar.plot(testlen,testangle,main="Test radial.plot.labels",rp.type="p",
  poly.col="green")
 radial.plot.labels(testlen,testangle,units="polar",labels=LETTERS[1:10])
 # reset par
 par(oldpar)



