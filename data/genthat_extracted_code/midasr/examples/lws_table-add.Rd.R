library(midasr)


### Name: +.lws_table
### Title: Combine 'lws_table' objects
### Aliases: +.lws_table

### ** Examples

nlmn <- expand_weights_lags("nealmon",0,c(4,8),1,start=list(nealmon=rep(0,3)))
nbt <- expand_weights_lags("nbeta",0,c(4,8),1,start=list(nbeta=rep(0,4)))

nlmn+nbt



