cat("Show how kktc works\n")
require(optimx)

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

xx<-0.5*c(pi,pi)
ans <- list() # set up structure


# can call following if optimx present and updated
# ans <- optimr(xx, jones, jonesg, method="Rvmmin")
# ans

ans$par <- c(3.154083, -3.689620)
kkans <- kktchk(ans$par, jones, jonesg)
kkans
