library(sphet)


### Name: stslshac
### Title: Spatial two stages least square with HAC standard errors
### Aliases: stslshac tsls
### Keywords: models

### ** Examples

library(spdep)
data(columbus)
listw<-nb2listw(col.gal.nb)
data(coldis)
res<-stslshac(CRIME~HOVAL + INC, data=columbus,listw=listw,  distance=coldis, type='Triangular')
summary(res)



