library(simFrame)


### Name: eusilcP
### Title: Synthetic EU-SILC data
### Aliases: eusilcP eusilcp
### Keywords: datasets

### ** Examples

data(eusilcP)
summary(eusilcP)

strata <- stratify(eusilcP, c("region", "gender"))
summary(strata)



