library(ExpDes.pt)


### Name: fat2.ad.dic
### Title: Fatorial duplo com um tratamento adicional em DIC
### Aliases: fat2.ad.dic

### ** Examples

data(ex8)
attach(ex8)
data(secaAd)
fat2.ad.dic(inoculante, biodiesel, vaso, seca, secaAd, quali = c(TRUE,FALSE), mcomp = "tukey", 
 fac.names = c("Inoculante", "Biodiesel"), sigT = 0.05, sigF = 0.05)



