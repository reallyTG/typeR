library(PtProcess)


### Name: simple_gif
### Title: Non-Homogeneous Poisson Processes
### Aliases: expfourier_gif exppoly_gif fourier_gif poly_gif simple_gif
### Keywords: models

### ** Examples

expfourier_gif(NULL, c(1.1,1.2,1.3), c(2,3,1,2,3,4), TT=NA)
#  Evaluates:  lambda_g(t) = exp(3 + 1*cos(2*pi*t/2) + 2*cos(4*pi*t/2) +
#                                3*sin(2*pi*t/2) + 4*sin(4*pi*t/2))
#  lambda_g(1.1) = 162.56331
#  lambda_g(1.2) = 127.72599
#  lambda_g(1.3) =  23.83979

expfourier_gif(NULL, NULL, c(2,3,1,2,3,4), TT=c(3,4))
#  Let:  lambda_g(t) = exp(3 + 1*cos(2*pi*t/2) + 2*cos(4*pi*t/2) +
#                              3*sin(2*pi*t/2) + 4*sin(4*pi*t/2))
#  Evaluates: integral_3^4 lambda_g(t) dt = 46.21920


#--------------------------------------------------------
#   Plot intensity function: lambda(t) = 3 + 3*sin(t)
#   on interval (0, 6*pi), no marks

params <- c(2*pi, 3, 0, 3)
TT <- c(0, 6*pi)
x <- seq(TT[1], TT[2], length.out=500)

plot(x, fourier_gif(NULL, x, params, TT=NA),
     ylim=c(0, 6), type="l", axes=FALSE,
     xlab="t",
     ylab=expression(lambda(t) == 3 + 3*phantom(.)*plain(sin)*phantom(.)*t),
     main="Sinusoidal Intensity Function", font.main=1)
abline(h=params[2], lty=2, col="red")
box()
axis(2)
axis(1, at=0, labels=0)
axis(1, at=2*pi, labels=expression(2*pi))
axis(1, at=4*pi, labels=expression(4*pi))
axis(1, at=6*pi, labels=expression(6*pi))

#   Now define a model object
#   note NULL "marks" argument, see manual page for "mpp"
z <- mpp(data=NULL,
         gif=fourier_gif,
         marks=list(NULL, NULL),
         params=params,
         gmap=expression(params),
         mmap=NULL,
         TT=TT)

#   Simulate event times
z <- simulate(z, seed=3, max.rate=6)

#   Plot simulated times on sine curve
x <- z$data$time
points(x, fourier_gif(NULL, x, params, TT=NA), col="blue", lwd=5)

#   Number of simulated events
print(nrow(z$data))

#   Estimate parameters based on simulated data
parmap <- function(y, p){
    #    fix parameters 1 and 3
    y$params <- c(2*pi, p[1], 0, p[2])
    return(y)
}

initial <- c(3, 3)
y <- nlm(neglogLik, initial, object=z, pmap=parmap,
         print.level=2, iterlim=20, stepmax=0.1)
print(y$estimate)



