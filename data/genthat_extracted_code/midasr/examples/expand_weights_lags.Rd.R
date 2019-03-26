library(midasr)


### Name: expand_weights_lags
### Title: Create table of weights, lags and starting values
### Aliases: expand_weights_lags

### ** Examples


expand_weights_lags(c("nealmon","nbeta"),0,c(4,8),1,start=list(nealmon=rep(0,3),nbeta=rep(0,4)))
nlmn <- expand_weights_lags("nealmon",0,c(4,8),1,start=list(nealmon=rep(0,3)))
nbt <- expand_weights_lags("nbeta",0,c(4,8),1,start=list(nbeta=rep(0,4)))

nlmn+nbt



