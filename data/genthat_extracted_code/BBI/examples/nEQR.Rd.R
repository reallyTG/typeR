library(BBI)


### Name: nEQR
### Title: nEQR
### Aliases: nEQR

### ** Examples

## Loading the exemple data
data("metab")
data("morpho")
## Computing BBI indices
BI_metab <- BBI(metab)
BI_morpho <- BBI(morpho)
## And then computing nEQR
eqr <- nEQR(BI_metab$BBI)
## print nEQR values
eqr$nEQR
## print discrete status
eqr$nEQRclass



