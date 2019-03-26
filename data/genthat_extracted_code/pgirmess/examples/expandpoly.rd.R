library(pgirmess)


### Name: expandpoly
### Title: Homothetia (size expansion) of a polygon
### Aliases: expandpoly
### Keywords: manip

### ** Examples


x<-c(-5,-4.5,0,10,5)
y<-c(-10,0,5,5,-8)
poly<-cbind(x,y)
plot(-10:20,-20:10,type="n")
polygon(poly)
polygon(expandpoly(poly,1.5),border="red")
polygon(expandpoly(poly,0.5),border="blue")




