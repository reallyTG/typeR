library(spdep)


### Name: LOSH.cs
### Title: Chi-square based test for local spatial heteroscedasticity
### Aliases: LOSH.cs
### Keywords: spatial

### ** Examples

    data(boston, package="spData")
    resLOSH <- LOSH.cs(boston.c$NOX, nb2listw(boston.soi))
    hist(resLOSH[,"Hi"])
    mean(resLOSH[,"Hi"])



