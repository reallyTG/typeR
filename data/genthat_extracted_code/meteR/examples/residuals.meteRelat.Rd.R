library(meteR)


### Name: residuals.meteRelat
### Title: Compute residuals between METE predictions and date of a
###   meteRelat object
### Aliases: residuals.meteRelat

### ** Examples

data(arth)
esf1 <- meteESF(spp=arth$spp,
                abund=arth$count,
                power=arth$mass^(.75),
                minE=min(arth$mass^(.75)))
ebar1 <- ebar(esf1)
residuals(ebar1)



