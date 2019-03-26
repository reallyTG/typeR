# test function from book by Owen Jones et al book

# function is 2 variables to be maximized
#  f(x,y)=sin(x^2/2 - y^2/4)*cos(2x-exp(y))

# ?? seems to have unstable parameter 1

jones<-function(xx){
   x<-xx[1]
   y<-xx[2]
   ff<-sin(x*x/2 - y*y/4)*cos(2*x-exp(y))
   ff<- -ff
}

jonesg <- function(xx) {
   x<-xx[1]
   y<-xx[2]
   gx <-  cos(x * x/2 - y * y/4) * ((x + x)/2) * cos(2 * x - exp(y)) - 
         sin(x * x/2 - y * y/4) * (sin(2 * x - exp(y)) * 2)
   gy <- sin(x * x/2 - y * y/4) * (sin(2 * x - exp(y)) * exp(y)) - cos(x * 
          x/2 - y * y/4) * ((y + y)/4) * cos(2 * x - exp(y))
   gg <- - c(gx, gy)
}

tufn <- function (par) {
    f <- jones(par)
    g <- jonesg(par)
    attr(f, "gradient") <- g
    attr(f, "hessian") <- NULL
    f
}
require(Rtnmin)

xx<-0.5*c(pi,pi)
atn<-tn(xx, tufn)
atn
tmp <- readline("continue")

lo<-c(0,0)
up<-c(1.2*pi, 1.2*pi)
atnb<-tnbc(xx, tufn, lower=lo, upper=up)
atnb

