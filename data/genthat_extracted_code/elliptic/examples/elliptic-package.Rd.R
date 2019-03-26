library(elliptic)


### Name: elliptic-package
### Title: Weierstrass and Jacobi Elliptic Functions
### Aliases: elliptic-package elliptic
### Keywords: package

### ** Examples

     ## Example 8, p666, RHS:
 P(z=0.07 + 0.1i, g=c(10,2)) 

     ## Now a nice little plot of the zeta function:
 x <- seq(from=-4,to=4,len=100)
 z <- outer(x,1i*x,"+")
 par(pty="s")
 view(x,x,limit(zeta(z,c(1+1i,2-3i))),nlevels=3,scheme=1)
 view(x,x,P(z*3,params=equianharmonic()),real=FALSE)

     ## Some number theory:
 mobius(1:10)
 plot(divisor(1:300,k=1),type="s",xlab="n",ylab="divisor(n,1)")

    ## Primitive periods:
 as.primitive(c(3+4.01i , 7+10i))
 as.primitive(c(3+4.01i , 7+10i),n=10)   # Note difference

    ## Now some contour integration:
 f <- function(z){1/z}
 u <- function(x){exp(2i*pi*x)}
 udash <- function(x){2i*pi*exp(2i*pi*x)}
 integrate.contour(f,u,udash) - 2*pi*1i


 x <- seq(from=-10,to=10,len=200)
 z <- outer(x,1i*x,"+")
 view(x,x,P(z,params=lemniscatic()),real=FALSE)
 view(x,x,P(z,params=pseudolemniscatic()),real=FALSE)
 view(x,x,P(z,params=equianharmonic()),real=FALSE)



