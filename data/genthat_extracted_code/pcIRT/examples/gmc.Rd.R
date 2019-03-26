library(pcIRT)


### Name: gmc.CRSM
### Title: Graphical model check
### Aliases: gmc.CRSM gmc gmc.aLR gmc.CRSM gmc.aLR
### Keywords: check graphical model

### ** Examples


#estimate CRSM for the first three items
data(analog)
res_cr <- CRSM(extraversion, low=-10, high=10)

#graphical model check for CRSM for the first three items with default split
#criterion score
gmc(res_cr)





