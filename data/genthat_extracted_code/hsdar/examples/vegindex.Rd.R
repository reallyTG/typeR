library(hsdar)


### Name: vegindex
### Title: vegindex
### Aliases: vegindex
### Keywords: multivariate

### ** Examples

## Example calculating NDVI
data(spectral_data)
ndvi <- vegindex(spectral_data, "NDVI")


## Example calculating all available indices
## Get available indices
avl <- vegindex()
vi <- vegindex(spectral_data, avl)

## Self-defined indices
## NDVI
vi <- vegindex(spectral_data, "(R800-R680)/(R800+R680)")
## NDNI
vi <- vegindex(spectral_data, 
               "(log(1/R1510) - log(1/R1680))/(log(1/R1510) + log(1/R1680))")
## D1
vi <- vegindex(spectral_data, "D730/D706")
## Example using second derivative spectra
vi <- vegindex(spectral_data, "(S930-S710)/(S930+S710)")



