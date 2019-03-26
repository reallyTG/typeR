library(IHSEP)


### Name: h.fn.exp
### Title: Mean Intensity of the Self-Exciting Point Process With an
###   Exponential Excitation Function 'h.fn.exp' calculates the mean
###   intensity function h(t) which solves the integral equation
###   h(t)=nu(t)+\int_0^t g(t-s)h(s)ds, t>=q 0 , where the excitation
###   function is exponential: g(t)= gamma_1 e^{-gamma_2 t}.
### Aliases: h.fn.exp

### ** Examples

nu <- function(x)200+100*cos(pi*x);
x <- 1:500/100;
y <- sapply(x,h.fn.exp,nu=nu,g.p=c(2,1));
h <- splinefun(x,y);
g <- function(x)2*exp(-x)
round(nu(x)+sapply(x,function(x)integrate(function(u)g(x-u)*h(u),0,x)$value) - y,5)



