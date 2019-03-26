library(plotrix)


### Name: vectorField
### Title: Display magnitude/direction vectors
### Aliases: vectorField
### Keywords: misc

### ** Examples

 ## Not run: 
##D   # this requires the maps package, and just wouldn't pass check
##D   require(maps)
##D   map("world",xlim=c(110,155),ylim=c(-40,-10))
##D   par(xpd=TRUE)
##D   text(132,-5,"Approximate magnetic deviation - Australia",cex=1.5)
##D   par(xpd=FALSE)
##D   long<-rep(seq(117.5,152.5,by=5),6)
##D   lat<-rep(c(-12.5,-17.5,-22.5,-27.5,-32.5,-37.5),each=8)
##D   # just show the direction, don't have a magnitude difference
##D   mag<-rep(1,48)
##D   devdeg<-c(110,98,85,65,65,65,65,65,
##D    115,100,90,80,72,66,63,55,
##D    130,100,90,82,72,67,62,54,
##D    122,111,95,86,70,67,56,48,
##D    118,116,110,87,74,68,62,45,
##D    128,115,107,90,78,66,53,45)
##D   vectorField(devdeg,mag,long,lat,scale=0.7,vecspec="deg")
##D  
## End(Not run)
 # do a magnitude/direction plot with radians
 plot(1:10,type="n",main="Random vectors")
 mag<-runif(100)+1
 dir<-runif(100)*2*pi
 xpos<-rep(1:10,10)
 ypos<-rep(1:10,each=10)
 vectorcol<-sample(colors(),100)
 vectorField(dir,mag,xpos,ypos,scale=0.8,vecspec="rad",col=vectorcol)



