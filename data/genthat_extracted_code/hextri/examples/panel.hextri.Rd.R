library(hextri)


### Name: panel.hextri
### Title: A lattice panel function for hexagonal binning with classes
### Aliases: panel.hextri
### Keywords: hplot

### ** Examples

library(lattice)
xx<-rnorm(1000)
yy<-rnorm(1000)
cc<-cut(xx*yy,c(-Inf,-.4,0,.4,Inf))
zz<-cut(xx+yy,c(-Inf,-1,0,1,Inf))

plot(xx,yy,col=(1:4)[cc])
xyplot(yy~xx|zz, panel=panel.hextri,groups=cc,colours=1:4,style="size",nbins=10)

data(airquality)
airquality$o3group<-with(airquality, cut(Ozone, c(0,18,60,Inf)))

xyplot(Temp~Solar.R|equal.count(Wind,4), groups=o3group, panel=panel.hextri,
  data=na.omit(airquality),colours=c("royalblue","grey60","goldenrod"),
  strip=strip.custom(var.name="Wind Speed"),xlab="Solar Radiation (langley)",
  ylab="Temperature (F)")



