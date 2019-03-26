library(BBI)


### Name: BBI
### Title: BBI
### Aliases: BBI

### ** Examples

## Loading the exemple data
data("metab")
data("morpho")
## Computing BBI indices
BI_metab <- BBI(metab)
BI_morpho <- BBI(morpho)
## print values
BI_metab$BBI
## print classes
BI_metab$BBIclass



