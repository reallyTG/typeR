library(meteR)


### Name: downscaleSAR
### Title: Downscale the species area relationship (SAR) or endemics area
###   relationship (EAR)
### Aliases: downscaleSAR

### ** Examples

data(anbo)
anbo.esf <- meteESF(spp=anbo$spp, abund=anbo$count)
anbo.thr.downscale <- downscaleSAR(anbo.esf, 2^(seq(-3, 4, length=7)), 16)
plot(anbo.thr.downscale)

## theoretical SARs from state variables only
thr.downscale <- downscaleSAR(meteESF(S0=40, N0=400), 2^seq(-1,4,by=1), 16)
thr.downscaleEAR <- downscaleSAR(meteESF(S0=40, N0=400), 2^seq(-1, 4, by=1), 16, EAR=TRUE)
plot(thr.downscale, ylim=c(0, 40), col='red')
plot(thr.downscaleEAR, add=TRUE, col='blue')



