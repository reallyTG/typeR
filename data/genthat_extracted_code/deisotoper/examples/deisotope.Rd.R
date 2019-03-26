library(deisotoper)


### Name: deisotope
### Title: Deisotope a Mass Spectrum
### Aliases: deisotope

### ** Examples


x <- list(mZ = c(1, 2, 2.5, 3), intensity = rep(1, 4), pepmass=600, charge=2)

xd <- deisotope(dtoper <- deisotoper(), x)
plot.deisotoper(x, xd)
summary(dtoper)




