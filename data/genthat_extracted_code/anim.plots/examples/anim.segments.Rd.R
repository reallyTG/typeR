library(anim.plots)


### Name: anim.segments
### Title: Draw an animation of line segments or arrows.
### Aliases: anim.segments anim.arrows anim.segmentplot anim.arrowplot

### ** Examples

anim.segments(x0=rep(1:5, 5), y0=rep(1:5, each=5), y1=rep(2:6, each=5), 
     times=rep(1:5, each=5) )
 
## Short version
anim.arrowplot(rep(1:5, 5), rep(1:5, each=5), times=5)

if (require('maps')) {
   hr <- subset(hurricanes, lat > 0 & lat < 50 & lon > -95 & lon < -20 & 
         Shour %% 6 == 0)
   hr$dlat <- cos(hr$diruv/360*2*pi) * hr$maguv / 8
   hr$dlon <- sin(hr$diruv/360*2*pi) * hr$maguv / 8
   hr$name <- sub("\\s+$", "", hr$name)
   map('world', xlim=c(-95,-20), ylim=c(0,50))
   title("Hurricanes, 2009")
   with(hr[!duplicated(hr$name),], text(lon, lat, 
         labels=paste0(name, "\n", Yr), cex=0.8))
   with(hr, anim.arrows(x0=lon, y0=lat, y1=lat+dlat, x1=lon+dlon, 
         times=Shour, speed=12, col=rgb(0,0,1,0.8), length=.1, lwd=2)) 
}



