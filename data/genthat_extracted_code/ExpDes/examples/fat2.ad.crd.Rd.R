library(ExpDes)


### Name: fat2.ad.crd
### Title: Double factorial scheme plus one additional treatment in CRD
### Aliases: fat2.ad.crd

### ** Examples

data(ex8)
attach(ex8)
data(secaAd)
fat2.ad.crd(inoculante, biodiesel, vaso, seca, secaAd, quali = c(TRUE,FALSE), mcomp = "tukey", 
 fac.names = c("Inoculant", "Biodiesel"), sigT = 0.05, sigF = 0.05)



