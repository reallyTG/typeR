library(dlm)


### Name: dlmMLE
### Title: Parameter estimation by maximum likelihood
### Aliases: dlmMLE
### Keywords: misc

### ** Examples

data(NelPlo)
### multivariate local level -- seemingly unrelated time series
buildSu <- function(x) {
  Vsd <- exp(x[1:2])
  Vcorr <- tanh(x[3])
  V <- Vsd %o% Vsd
  V[1,2] <- V[2,1] <- V[1,2] * Vcorr
  Wsd <- exp(x[4:5])
  Wcorr <- tanh(x[6])
  W <- Wsd %o% Wsd
  W[1,2] <- W[2,1] <- W[1,2] * Wcorr
  return(list(
              m0 = rep(0,2),
              C0 = 1e7 * diag(2),
              FF = diag(2),
              GG = diag(2),
              V = V,
              W = W))
}

suMLE <- dlmMLE(NelPlo, rep(0,6), buildSu); suMLE
buildSu(suMLE$par)[c("V","W")]
StructTS(NelPlo[,1], type="level") ## compare with W[1,1] and V[1,1]
StructTS(NelPlo[,2], type="level") ## compare with W[2,2] and V[2,2]

## multivariate local level model with homogeneity restriction
buildHo <- function(x) {
  Vsd <- exp(x[1:2])
  Vcorr <- tanh(x[3])
  V <- Vsd %o% Vsd
  V[1,2] <- V[2,1] <- V[1,2] * Vcorr
  return(list(
              m0 = rep(0,2),
              C0 = 1e7 * diag(2),
              FF = diag(2),
              GG = diag(2),
              V = V,
              W = x[4]^2 * V))
}

hoMLE <- dlmMLE(NelPlo, rep(0,4), buildHo); hoMLE
buildHo(hoMLE$par)[c("V","W")]



