library(bigsplines)


### Name: imagebar
### Title: Displays a Color Image with Colorbar
### Aliases: imagebar

### ** Examples

##########   EXAMPLE 1   ##########

myfun <- function(x){
  2*sin(sqrt(x[,1]^2+x[,2]^2+.1))/sqrt(x[,1]^2+x[,2]^2+.1)
}
x <- expand.grid(seq(-8,8,l=100),seq(-8,8,l=100))
imagebar(seq(-8,8,l=100),seq(-8,8,l=100),matrix(myfun(x),100,100),
         xlab=expression(italic(x)[1]),ylab=expression(italic(x)[2]),
         zlab=expression(hat(italic(y))),zlim=c(-0.5,2),zaxis.at=seq(-0.5,2,by=0.5))


##########   EXAMPLE 2   ##########

myfun <- function(x1v,x2v){
  sin(2*pi*x1v) + 2*sin(sqrt(x2v^2+.1))/sqrt(x2v^2+.1)
}
x <- expand.grid(x1v=seq(0,1,l=100),x2v=seq(-8,8,l=100))
imagebar(seq(0,1,l=100),seq(-8,8,l=100),matrix(myfun(x$x1v,x$x2v),100,100),
         col=c("red","orange","yellow","white"),xlab="x1v",ylab="x2v",
         zlab=expression(hat(italic(y))),zlim=c(-1.5,3),zaxis.at=seq(-1.5,3,by=0.5))


##########   EXAMPLE 3   ##########

myfun <- function(x1v,x2v){
  sin(3*pi*x1v) + sin(2*pi*x2v) + 3*cos(pi*(x1v-x2v))
}
x <- expand.grid(x1v=seq(-1,1,l=100),x2v=seq(-1,1,l=100))
imagebar(seq(-1,1,l=100),seq(-1,1,l=100),matrix(myfun(x$x1v,x$x2v),100,100),
         col=c("blue","green","light green","yellow"),xlab="x1v",ylab="x2v",
         zlab=expression(hat(italic(y))),zlim=c(-5,5),zaxis.at=c(-5,0,5),
         zaxis.labels=c("low","med","high"))




