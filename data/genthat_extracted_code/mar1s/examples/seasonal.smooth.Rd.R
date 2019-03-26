library(mar1s)


### Name: seasonal.smooth
### Title: Smooth Seasonal Component of Time Series
### Aliases: seasonal.smooth
### Keywords: ts

### ** Examples

set.seed(19860306)

## Artificial example
x <- ts(sin(2*pi*(3:97)/10) + 0.5*rnorm(length(3:97)),
	start = c(0, 3), frequency = 10)

fourier3 <- seasonal.smooth(x)
fourier9 <- seasonal.smooth(x, create.fourier.basis(nbasis = 9))
fourier9s<- seasonal.smooth(x, create.fourier.basis(nbasis = 9), 1E-6)

plot.default(time(x)%%1, x, xlab = "Phase")
points(fourier3, pch = 20,  col = "blue")
lines(attr(fourier3, "fd"), col = "blue")
points(fourier9, pch = 20,  col = "green")
lines(attr(fourier9, "fd"), col = "green")
points(fourier9s,pch = 20,  col = "red")
lines(attr(fourier9s, "fd"),col = "red")
legend("bottomleft",
       legend = c("Fourier-3 basis",
		  "Fourier-9 basis",
		  "Fourier-9 basis, smooth"),
       col = c("blue", "green", "red"),
       lty = "solid")

## Realistic example
data(nesterov.index, package = "mar1s")
x <- log(nesterov.index[, "mean"])
x[x < -10] <- -Inf

fourier3 <- seasonal.smooth(x)
fourier9 <- seasonal.smooth(x, create.fourier.basis(nbasis = 9))
fourier9s<- seasonal.smooth(x, create.fourier.basis(nbasis = 9), 2E-5)

plot.default(time(x)%%1, x, xlab = "Phase", pch = ".")
lines(attr(fourier3, "fd"), col = "blue")
lines(attr(fourier9, "fd"), col = "green")
lines(attr(fourier9s,"fd"), col = "red")
legend("topleft",
       legend = c("Fourier-3 basis",
		  "Fourier-9 basis",
		  "Fourier-9 basis, smooth"),
       col = c("blue", "green", "red"),
       lty = "solid")



