library(spectral)


### Name: spec.fft
### Title: 1D/2D spectrum of the Fourier transform
### Aliases: spec.fft

### ** Examples

# 1D Example with two frequencies
#################################

x <- seq(0, 1, length.out = 1e3)
y <- sin(4 * 2 * pi * x) + 0.5 * sin(20 * 2 * pi * x)
FT <- spec.fft(y, x)
par(mfrow = c(2, 1))
plot(x, y, type = "l", main = "Signal")
plot(
  FT,
  ylab = "Amplitude",
  xlab = "Frequency",
  type = "l",
  xlim = c(-30, 30),
  main = "Spectrum"
)

# 2D example with a propagating wave
####################################

x <- seq(0, 1, length.out = 1e2)
y <- seq(0, 1, length.out = 1e2)

# calculate the data
m <- matrix(0, length(x), length(y))
for (i in 1:length(x))
  for (j in 1:length(y))
    m[i, j] <- sin(4 * 2 * pi * x[i] + 10 * 2 * pi * y[j])

# calculate the spectrum
FT <- spec.fft(x = x, y = y, z = m)

# plot
par(mfrow = c(2, 1))
rasterImage2(x = x,
           y = y,
           z = m,
           main = "Propagating Wave")
plot(
  FT,
  main = "2D Spectrum",
  palette = "wb"
  ,
  xlim = c(-20, 20),
  ylim = c(-20, 20),
  zlim = c(0, 0.51)
  ,
  xlab = "fx",
  ylab = "fy",
  zlab = "A",
  ndz = 3,
  z.adj = c(0, 0.5)
  ,
  z.cex = 1
)


# calculating the derivative with the help of FFT
################################################
#
# Remember, a signal has to be band limited.
# !!! You must use a window function !!!
#

# preparing the data
x <- seq(-2, 2, length.out = 1e4)
dx <- mean(diff(x))
y <- win.tukey(x) * (-x ^ 3 + 3 * x)

# calcualting spectrum
FT <- spec.fft(y = y, center = TRUE)
# calculating the first derivative
FT$A <- FT$A * 2 * pi * 1i * FT$fx
# back transform
dm <- spec.fft(FT, inverse = TRUE)

# plot
par(mfrow=c(1,1))
plot(
  x,
  c(0, diff(y) / dx),
  type = "l",
  col = "grey",
  lty = 2,
  ylim = c(-4, 3)
)
# add some points to the line for the numerical result 
points(approx(x, Re(dm$y) / dx, n = 100))
# analytical result
curve(-3 * x ^ 2 + 3,
      add = TRUE,
      lty = 3,
      n = length(x))

legend(
  "topright",
  c("analytic", "numeric", "spectral"),
  title = "diff",
  lty = c(3, 2, NA),
  pch = c(NA, NA, 1),
  col=c("black","grey","black")
)
title(expression(d / dx ~ (-x ^ 3 + 3 * x)))



