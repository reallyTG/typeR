library(signal)


### Name: Arma
### Title: Create an autoregressive moving average (ARMA) model.
### Aliases: Arma as.Arma as.Arma.Arma as.Arma.Zpg as.Arma.Ma
### Keywords: math

### ** Examples

filt <- Arma(b = c(1, 2, 1)/3, a = c(1, 1))
zplane(filt)



