library(mvLSW)


### Name: rmvLSW
### Title: Sample a Multivariate Locally Stationary Wavelet Process
### Aliases: rmvLSW simulate.mvLSW
### Keywords: rmvLSW, simulate.mvLSW

### ** Examples

## Define evolutionary wavelet spectrum, structure only on level 2
Spec <- array(0, dim = c(3, 3, 8, 256))
Spec[1, 1, 2, ] <- 10
Spec[2, 2, 2, ] <- c(rep(5, 64), rep(0.6, 64), rep(5, 128))
Spec[3, 3, 2, ] <- c(rep(2, 128), rep(8, 128))
Spec[2, 1, 2, ] <- Spec[1, 2, 2, ] <- punif(1:256, 65, 192)
Spec[3, 1, 2, ] <- Spec[1, 3, 2, ] <- c(rep(-1, 128), rep(5, 128))
Spec[3, 2, 2, ] <- Spec[2, 3, 2, ] <- -0.5

## Define Haar wavelet function and create mvLSW object
EWS <- as.mvLSW(x = Spec, filter.number = 1, family = "DaubExPhase",
  min.eig.val = NA)
plot(EWS, style = 2, info = 2)

## Sample with Gaussian innovations
set.seed(10)
X <- rmvLSW(Spectrum = EWS)
plot(X)

## Alternatively:
X1 <- simulate(object = EWS)
plot(X1)

## Define smoother wavelet function and create mvLSW object
EWS2 <- as.mvLSW(x = Spec, filter.number = 10, family = "DaubExPhase")

## Sample with logistic innovations
set.seed(10)
X2 <- rmvLSW(Spectrum = EWS2, noiseFN = rlogis, scale = sqrt(3)/pi)
plot(X2)



