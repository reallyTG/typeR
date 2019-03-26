library(pracma)


### Name: trapz
### Title: Trapezoidal Integration
### Aliases: trapz cumtrapz trapzfun
### Keywords: math

### ** Examples

  # Calculate the area under the sine curve from 0 to pi:
  n <- 101
  x <- seq(0, pi, len = n)
  y <- sin(x)
  trapz(x, y)                       #=> 1.999835504

  # Use a correction term at the boundary: -h^2/12*(f'(b)-f'(a))
  h  <- x[2] - x[1]
  ca <- (y[2]-y[1]) / h
  cb <- (y[n]-y[n-1]) / h
  trapz(x, y) - h^2/12 * (cb - ca)  #=> 1.999999969

  # Use two complex inputs
  z  <- exp(1i*pi*(0:100)/100)
  ct <- cumtrapz(z, 1/z)
  ct[101]                           #=> 0+3.14107591i

  f <- function(x) x^(3/2)          # 
  trapzfun(f, 0, 1)                 #=> 0.4 with 11 iterations



