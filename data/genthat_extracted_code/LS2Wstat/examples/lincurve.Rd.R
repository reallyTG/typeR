library(LS2Wstat)


### Name: lincurve
### Title: A linear function between two constant values.
### Aliases: lincurve
### Keywords: manip

### ** Examples


x<-seq(0,1,length=128)

y<-lincurve(x,start=1,end=2,a=.25)

plot(x,y,type="l")




