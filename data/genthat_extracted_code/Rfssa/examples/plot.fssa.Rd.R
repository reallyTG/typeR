library(Rfssa)


### Name: plot.fssa
### Title: Plotting fssa Objects
### Aliases: plot.fssa

### ** Examples

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
plot(U)
plot(U,d=4,type="efunctions")
plot(U,d=4,type="vectors")
plot(U,d=5,type="paired")
plot(U,d=5,type="wcor")
plot(U,d=5,type="meanvectors")
plot(U,d=5,type="efunctions2")
plot(U,d=5,type="meanpaired")



