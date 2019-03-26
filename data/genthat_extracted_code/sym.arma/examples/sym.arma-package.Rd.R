library(sym.arma)


### Name: sym.arma-package
### Title: Autoregressive and Moving Average Symmetric Models
### Aliases: sym.arma-package sym.arma

### ** Examples

library(sym.arma)
data(assets)
fit <-  elliptical.ts(assets$msf[2122:2240],order=c(1,0,0),trace=TRUE)
qqplot(fit,envelope=FALSE)



