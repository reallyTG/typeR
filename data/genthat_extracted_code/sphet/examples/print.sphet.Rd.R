library(sphet)


### Name: print.sphet
### Title: print method for class sphet
### Aliases: print.sphet print.summary.sphet

### ** Examples

library(spdep)
data(columbus)
listw<-nb2listw(col.gal.nb)
res<-gstslshet(CRIME~HOVAL + INC, data=columbus, listw=listw)
summary(res)




