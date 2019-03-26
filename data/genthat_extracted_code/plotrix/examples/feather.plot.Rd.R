library(plotrix)


### Name: feather.plot
### Title: Display vectors along a horizontal reference line
### Aliases: feather.plot
### Keywords: misc

### ** Examples

 dev.new(width=8,height=3)
 r<-0.6+rnorm(24)/5
 theta<-c(seq(15*pi/16,pi/16,length.out=12),
  seq(17*pi/16,31*pi/16,length.out=12))
 feather.plot(r,theta,xlabels=1:24,
  main="Standard Coordinates",xlab="Time",ylab="Value")
 # rearrange theta for meteorological coordinates
 feather.plot(r,c(theta[19:24],rev(theta[7:18]),theta[1:6]),xlabels=1:24,fp.type="m",
  main="Meteorological Coordinates",xlab="Time",ylab="Value")
 dev.off()



