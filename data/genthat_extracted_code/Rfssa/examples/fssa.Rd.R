library(Rfssa)


### Name: fssa
### Title: Functional Singular Spectrum Analysis
### Aliases: fssa

### ** Examples

## Don't show: 
require(Rfssa)
require(fda)
n <- 50 # Number of points in each function.
d <- 9
N <- 60
sigma <- 0.5
set.seed(110)
E <- matrix(rnorm(N*d,0,sigma/sqrt(d)),ncol = N, nrow = d)
basis <- create.fourier.basis(c(0, 1), d)
Eps <- fd(E,basis)
om1 <- 1/10
om2 <- 1/4
f0 <- function(tau, t) 2*exp(-tau*t/10)
f1 <- function(tau, t) 0.2*exp(-tau^3) * cos(2 * pi * t * om1)
f2 <- function(tau, t) -0.2*exp(-tau^2) * cos(2 * pi * t * om2)
tau <- seq(0, 1, length = n)
t <- 1:N
f0_mat <- outer(tau, t, FUN = f0)
f0_fd <- smooth.basis(tau, f0_mat, basis)$fd
f1_mat <- outer(tau, t, FUN = f1)
f1_fd <- smooth.basis(tau, f1_mat, basis)$fd
f2_mat <- outer(tau, t, FUN = f2)
f2_fd <- smooth.basis(tau, f2_mat, basis)$fd
Y_fd <- f0_fd+f1_fd+f2_fd
L <-10
U <- fssa(Y_fd,L)
gr <- as.list(1:4)
Q <- freconstruct(U, gr)
ftsplot(tau,t,Q[[1]],space = 0.2,type=3,xlab = "Day")
## End(Don't show)
## Not run: 
##D ## Call Center Data
##D data("Callcenter")
##D require(fda)
##D require(Rfssa)
##D D <- matrix(sqrt(Callcenter$calls),nrow = 240)
##D N <- ncol(D)
##D time <- 1:N
##D K <- nrow(D)
##D u <- seq(0,K,length.out =K)
##D d <- 22 #Optimal Number of basises
##D basis <- create.bspline.basis(c(min(u),max(u)),d)
##D Ysmooth <- smooth.basis(u,D,basis)
##D Y <- Ysmooth$fd
##D ## fssa decomposition
##D L <- 28
##D U <- fssa(Y,L)
##D plot(U,d=13)
##D plot(U,d=9,type="efunctions")
##D plot(U,d=9,type="efunctions2")
##D plot(U,d=9,type="vectors")
##D plot(U,d=10,type="meanvectors")
##D plot(U,d=10,type="paired")
##D plot(U,d=10,type="meanpaired")
##D plot(U,d=10,type="wcor")
##D ## fssa reconstruction
##D gr <- list(1,2:3,4:5,6:7,8:20)
##D Q <- freconstruct(U, gr)
##D 
##D cols3 <- rainbow(N)
##D 
##D layout(matrix(c(1,1,2,3,4,5,6,6),nr=2))
##D par(mar=c(2,1,2,2))
##D plot(Y,lty=1,xlab="",main="Call Numbers(Observed)"
##D     ,ylab="",col=cols3)
##D     plot(Q[[1]],lty=1,xlab="",main="1st Component"
##D     ,ylab="",lwd=1,col=cols3)
##D     plot(Q[[2]],lty=1,xlab="",main="2nd Component"
##D     ,ylab="",lwd=1,col=cols3)
##D     plot(Q[[3]],lty=1,xlab="",main="3rd Component"
##D     ,ylab="",lwd=1,col=cols3)
##D     plot(Q[[4]],lty=1,xlab="",main="4th Component"
##D     ,ylab="",lwd=1,col=cols3)
##D     plot(Q[[5]],lty=1,xlab="",main="5th Component(Noise)"
##D     ,ylab="",lwd=1,col=cols3)
##D 
##D 
##D layout(matrix(c(1,1,2,3,4,5,6,6),nr=2))
##D par(mar=c(2,1,2,2))
##D ftsplot(u,time,Y,space = 0.2,type=3,ylab = "",xlab = "Day",main = "Call Numbers(Observed)")
##D ftsplot(u,time,Q[[1]],space = 0.2,type=3,ylab = "",xlab = "Day",main = "1st Component")
##D ftsplot(u,time,Q[[2]],space = 0.2,type=3,ylab = "",xlab = "Day",main = "2nd Component")
##D ftsplot(u,time,Q[[3]],space = 0.2,type=3,ylab = "",xlab = "Day",main = "3rd Component")
##D ftsplot(u,time,Q[[4]],space = 0.2,type=3,ylab = "",xlab = "Day",main = "4th Component")
##D ftsplot(u,time,Q[[5]],space = 0.2,type=3,ylab = "",xlab = "Day",main = "5th Component(Noise)")
## End(Not run)



