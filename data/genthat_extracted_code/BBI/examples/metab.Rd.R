library(BBI)


### Name: metab
### Title: Subset of metabarcoding data
### Aliases: metab
### Keywords: datasets

### ** Examples

## Loading the exemple data
data("metab")
## Computing BBI indices
BI_metab <- BBI(metab)
## And then computing nEQR
eqr <- nEQR(BI_metab$BBI)
## print nEQR values
eqr$nEQR
## print discrete status
eqr$nEQRclass



