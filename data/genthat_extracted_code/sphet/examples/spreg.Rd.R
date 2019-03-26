library(sphet)


### Name: spreg
### Title: GM estimation of a Cliff-Ord type model with Heteroskedastic
###   Innovations
### Aliases: spreg
### Keywords: models

### ** Examples

library(spdep)
data(columbus)
listw<-nb2listw(col.gal.nb)
res<-spreg(CRIME~HOVAL + INC, data=columbus , listw= listw,  model = "sarar", het = TRUE)
summary(res)



