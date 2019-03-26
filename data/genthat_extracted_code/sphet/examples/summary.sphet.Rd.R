library(sphet)


### Name: summary.sphet
### Title: print method for class sphet
### Aliases: summary.sphet sumres

### ** Examples

library(spdep)
data(columbus)
listw<-nb2listw(col.gal.nb)
res<-gstslshet(CRIME~HOVAL + INC, data=columbus, listw=listw)
summary(res)




