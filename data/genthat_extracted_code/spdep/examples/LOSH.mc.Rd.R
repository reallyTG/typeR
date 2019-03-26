library(spdep)


### Name: LOSH.mc
### Title: Bootstrapping-based test for local spatial heteroscedasticity
### Aliases: LOSH.mc
### Keywords: spatial

### ** Examples

    data(columbus, package="spData")
    resLOSH_mc <- LOSH.mc(columbus$CRIME, nb2listw(col.gal.nb), 2, 100)
    resLOSH_cs <- LOSH.cs(columbus$CRIME, nb2listw(col.gal.nb))
    plot(resLOSH_mc[,"Pr()"], resLOSH_cs[,"Pr()"])



