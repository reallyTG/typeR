library(bigsplines)


### Name: plotbar
### Title: Generic X-Y Plotting with Colorbar
### Aliases: plotbar

### ** Examples

##########   EXAMPLE 1   ##########

myfun <- function(x){
  2*sin(sqrt(x[,1]^2+x[,2]^2+.1))/sqrt(x[,1]^2+x[,2]^2+.1)
}
x <- expand.grid(seq(-8,8,l=100),seq(-8,8,l=100))
plotbar(x[,1],x[,2],myfun(x),
        xlab=expression(italic(x)[1]),
        ylab=expression(italic(x)[2]),
        zlab=expression(hat(italic(y))))


##########   EXAMPLE 2   ##########

myfun <- function(x1v,x2v){
  sin(2*pi*x1v) + 2*sin(sqrt(x2v^2+.1))/sqrt(x2v^2+.1)
}
x <- expand.grid(x1v=seq(0,1,l=100),x2v=seq(-8,8,l=100))
plotbar(x[,1],x[,2],myfun(x$x1v,x$x2v),
         col=c("red","orange","yellow","white"),
         xlab="x1v",ylab="x2v",zlab=expression(hat(italic(y))))


##########   EXAMPLE 3   ##########

myfun <- function(x1v,x2v){
  sin(3*pi*x1v) + sin(2*pi*x2v) + 3*cos(pi*(x1v-x2v))
}
x <- expand.grid(x1v=seq(-1,1,l=100),x2v=seq(-1,1,l=100))
plotbar(x[,1],x[,2],myfun(x$x1v,x$x2v),
         col=c("blue","green","light green","yellow"),
         xlab="x1v",ylab="x2v",zlab=expression(hat(italic(y))))




