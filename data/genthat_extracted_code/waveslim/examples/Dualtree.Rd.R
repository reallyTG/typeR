library(waveslim)


### Name: Dualtree
### Title: Dual-tree Complex Discrete Wavelet Transform
### Aliases: dualtree idualtree dualtree2D idualtree2D
### Keywords: ts

### ** Examples

## EXAMPLE: dualtree
x = rnorm(512)
J = 4
Faf = FSfarras()$af
Fsf = FSfarras()$sf
af = dualfilt1()$af
sf = dualfilt1()$sf
w = dualtree(x, J, Faf, af)
y = idualtree(w, J, Fsf, sf)
err = x - y
max(abs(err))

## Example: dualtree2D
x = matrix(rnorm(64*64), 64, 64)
J = 3
Faf = FSfarras()$af
Fsf = FSfarras()$sf
af = dualfilt1()$af
sf = dualfilt1()$sf
w = dualtree2D(x, J, Faf, af)
y = idualtree2D(w, J, Fsf, sf)
err = x - y
max(abs(err))

## Display 2D wavelets of dualtree2D.m

J <- 4
L <- 3 * 2^(J+1)
N <- L / 2^J
Faf <- FSfarras()$af
Fsf <- FSfarras()$sf
af <- dualfilt1()$af
sf <- dualfilt1()$sf
x <- matrix(0, 2*L, 3*L)
w <- dualtree2D(x, J, Faf, af)
w[[J]][[1]][[1]][N/2, N/2+0*N] <- 1
w[[J]][[1]][[2]][N/2, N/2+1*N] <- 1
w[[J]][[1]][[3]][N/2, N/2+2*N] <- 1
w[[J]][[2]][[1]][N/2+N, N/2+0*N] <- 1
w[[J]][[2]][[2]][N/2+N, N/2+1*N] <- 1
w[[J]][[2]][[3]][N/2+N, N/2+2*N] <- 1
y <- idualtree2D(w, J, Fsf, sf)
image(t(y), col=grey(0:64/64), axes=FALSE)



