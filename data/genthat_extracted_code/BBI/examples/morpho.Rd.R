library(BBI)


### Name: morpho
### Title: Subset of morphologic inventories data
### Aliases: morpho
### Keywords: datasets

### ** Examples

## Loading the exemple data
data("morpho")
## Computing BBI indices
BI_morpho <- BBI(morpho)
## And then computing nEQR
eqr <- nEQR(BI_morpho$BBI)
## print nEQR values
eqr$nEQR
## print discrete status
eqr$nEQRclass



