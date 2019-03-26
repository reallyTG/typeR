library(plotrix)


### Name: polygon.shadow
### Title: Display a shadow effect for an arbitrary polygon
### Aliases: polygon.shadow
### Keywords: misc

### ** Examples

 par(pty="s")
 plot(1:5,type="n",main="Polygon Shadow test",xlab="",ylab="",axes=FALSE)
 box()
 # do a shadow on a yellow square
 polygon(c(1,2.2,2.2,1),c(5,5,3.8,3.8),col="#ffff00")
 polygon.shadow(c(1.2,2,2,1.2),c(4.8,4.8,4,4),col=c("#ffff00","#cccc00"))
 polygon(c(1.2,2,2,1.2),c(4.8,4.8,4,4),col=c("#ff0000"))
 # a green triangle on a light blue square with a big offset
 polygon(c(4,5,5,4),c(2,2,1,1),col="#aaaaff")
 polygon.shadow(c(4.5,4.8,4.2),c(1.7,1.2,1.2),col=c("#aaaaff","#8888cc"),
  offset=c(0.1,-0.1),inflate=c(0.2,0.2))
 polygon(c(4.5,4.8,4.2),c(1.7,1.2,1.2),col=c("#00ff00"))
 # now a circle as a background
 polygon.shadow(cos(seq(0,2*pi,by=pi/20))+3,sin(seq(0,2*pi,by=pi/20))+3,
  offset=c(0,0),inflate=c(0.1,0.1))
 text(3,3,"Polygon shadow\nas a circular\ntext background",cex=1.5)



