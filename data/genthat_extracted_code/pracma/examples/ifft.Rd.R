library(pracma)


### Name: ifft
### Title: Inverse Fast Fourier Transformation
### Aliases: ifft ifftshift fftshift
### Keywords: array

### ** Examples

x <- c(1, 2, 3, 4)
(y <- fft(x))
ifft(x)
ifft(y)

##  Compute the derivative: F(df/dt) = (1i*k) * F(f)
#   hyperbolic secans f <- sech
df <- function(x) -sech(x) * tanh(x)
d2f <- function(x) sech(x) - 2*sech(x)^3
L <- 20                                 # domain [-L/2, L/2]
N <- 128                                # number of Fourier nodes
x <- linspace(-L/2, L/2, N+1)           # domain discretization
x <- x[1:N]                             # because of periodicity
dx <- x[2] - x[1]                       # finite difference
u <- sech(x)                            # hyperbolic secans
u1d <- df(x); u2d <- d2f(x)             # first and second derivative
ut <- fft(u)                            # discrete Fourier transform
k <- (2*pi/L)*fftshift((-N/2):(N/2-1))  # shifted frequencies
u1 <- Re(ifft((1i*k) * ut))             # inverse transform
u2 <- Re(ifft(-k^2 * ut))               # first and second derivative
## Not run: 
##D plot(x, u1d, type = "l", col = "blue")
##D points(x, u1)
##D grid()
##D figure()
##D plot(x, u2d, type = "l", col = "darkred")
##D points(x, u2)
##D grid()
## End(Not run)



