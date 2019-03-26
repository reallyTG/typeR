require(optimx)
# test function from book by Owen Jones et al

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

# Note: No hessian, so newton methods will fail

xx<-0.5*c(pi,pi)
ans<-opm(xx, jones, jonesg, method="ALL", control=list(trace=0))
print(summary(ans, order=value))
# tmp <- readline("continue")

lo<-c(0,0)
up<-c(1.2*pi, 1.2*pi)
ansb<-opm(xx, jones, jonesg, lower=lo, upper=up, method="ALL", control=list(trace=0))
print(summary(ansb, order=value))
# tmp <- readline("continue")

cat("Note: ansbnf shows failure for L-BFGS-B when trying to use forward diff approximation\n")

ansbnf<-opm(xx, jones, gr="grfwd", lower=lo, upper=up, method="ALL", control=list(trace=0))
print(summary(ansbnf, order=value))
# tmp <- readline("continue")

ansbnn<-opm(xx, jones, gr="grnd", lower=lo, upper=up, method="ALL", control=list(trace=0))
print(summary(ansbnn, order=value))
# tmp <- readline("continue")

