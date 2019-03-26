library(pgirmess)


### Name: polycirc2
### Title: Computes the polygon coordinates of a circle sector
### Aliases: polycirc2
### Keywords: dplot

### ** Examples

plot(c(-1,+1),c(-1,+1),type="n",asp=1)
polygon(polycirc2(),col="red")
polygon(polycirc2(init=pi,angle=pi/4),col="green")
polygon(polycirc2(init=1.5*pi,angle=pi/4),col="violet")
polygon(polycirc2(radius=0.5,center=c(0.5,1)),col="blue")

polycirc2(init=pi,angle=pi/4)



