library(adespatial)


### Name: msr.varipart
### Title: Moran spectral randomization for variation partitioning
### Aliases: msr.varipart

### ** Examples

library(ade4)
library(spdep)
data(mafragh)
## Performing standard variation partitioning
dudiY <- dudi.pca(mafragh$flo, scannf = FALSE, scale = FALSE)
mafragh.lw <- nb2listw(mafragh$nb)
me <- mem(mafragh.lw, MEM.autocor = "positive")
vprda <- varipart(dudiY, mafragh$env, me, type = "parametric")

## Adjust estimation and compute p-value by msr methods
vprda.msr <- msr(vprda, mafragh.lw, nrepet=99)
vprda.msr



