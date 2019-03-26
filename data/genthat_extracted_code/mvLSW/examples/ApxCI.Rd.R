library(mvLSW)


### Name: ApxCI
### Title: Evaluate the Approximate Confidence Interval of a mvEWS Estimate
### Aliases: ApxCI
### Keywords: ApxCI

### ** Examples

## Define evolutionary wavelet spectrum, structure only on level 2
Spec <- array(0, dim = c(3, 3, 8, 256))
Spec[1, 1, 2, ] <- 10
Spec[2, 2, 2, ] <- c(rep(5, 64), rep(0.6, 64), rep(5, 128))
Spec[3, 3, 2, ] <- c(rep(2, 128), rep(8, 128))
Spec[2, 1, 2, ] <- Spec[1, 2, 2, ] <- punif(1:256, 65, 192)
Spec[3, 1, 2, ] <- Spec[1, 3, 2, ] <- c(rep(-1, 128), rep(5, 128))
Spec[3, 2, 2, ] <- Spec[2, 3, 2, ] <- -0.5
EWS <- as.mvLSW(x = Spec, filter.number = 1, family = "DaubExPhase", 
  min.eig.val = NA)

## Sample time series and estimate the EWS.
set.seed(10)
X <- rmvLSW(Spectrum = EWS)
EWS_X <- mvEWS(X, kernel.name = "daniell", kernel.param = 20)

## Evaluate asymptotic spectral variance 
SpecVar <- varEWS(EWS_X)

## Plot Estimate & 95% confidence interval
CI <- ApxCI(object = EWS_X, var = SpecVar, alpha = 0.05)
plot(x = EWS_X, style = 2, info = 2, Interval = CI)




