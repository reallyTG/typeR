library(spdep)


### Name: LOSH
### Title: Local spatial heteroscedasticity
### Aliases: LOSH
### Keywords: spatial

### ** Examples

    data(boston, package="spData")
    resLOSH <- LOSH(boston.c$NOX, nb2listw(boston.soi))
    hist(resLOSH[,"Hi"])
    mean(resLOSH[,"Hi"])
  


