library(mvLSW)


### Name: as.mvLSW
### Title: Multivariate Locally Stationary Wavelet Object
### Aliases: as.mvLSW is.mvLSW
### Keywords: as.mvLSW, is.mvLSW

### ** Examples

## Define evolutionary wavelet spectrum, structure only on level 2
Spec <- array(0, dim = c(3, 3, 8, 256))
Spec[1, 1, 2, ] <- 10
Spec[2, 2, 2, ] <- c(rep(5, 64), rep(0.6, 64), rep(5, 128))
Spec[3, 3, 2, ] <- c(rep(2, 128), rep(8, 128))
Spec[2, 1, 2, ] <- Spec[1, 2, 2, ] <- punif(1:256, 65, 192)
Spec[3, 1, 2, ] <- Spec[1, 3, 2, ] <- c(rep(-1, 128), rep(5, 128))
Spec[3, 2, 2, ] <- Spec[2, 3, 2, ] <- -0.5

## Define EWS as mvLSW object
EWS <- as.mvLSW(x = Spec, filter.number = 1, family = "DaubExPhase", 
  names = c("A", "B", "C"), min.eig.val = NA)
is.mvLSW(EWS)
plot(EWS, style = 2, info = 2)



