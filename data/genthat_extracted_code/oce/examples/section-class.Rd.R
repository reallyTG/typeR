library(oce)


### Name: section-class
### Title: Class to Store Hydrographic Section Data
### Aliases: section-class

### ** Examples

library(oce)
data(section)
plot(section[['station', 1]])
pairs(cbind(z=-section[["pressure"]],T=section[["temperature"]],S=section[["salinity"]]))
## T profiles for first few stations in section, at common scale
par(mfrow=c(3,3))
Tlim <- range(section[["temperature"]])
ylim <- rev(range(section[["pressure"]]))
for (stn in section[["station", 1:9]])
    plotProfile(stn, xtype='potential temperature', ylim=ylim, Tlim=Tlim)




