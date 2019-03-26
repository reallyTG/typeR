library(sphet)


### Name: gstslshet
### Title: GM estimation of a Cliff-Ord type model with Heteroskedastic
###   Innovations
### Aliases: gstslshet impacts.gstsls
### Keywords: models

### ** Examples

library(spdep)
data(columbus)
listw<-nb2listw(col.gal.nb)
res<-gstslshet(CRIME~HOVAL + INC, data=columbus, listw=listw)
summary(res)



