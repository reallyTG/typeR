library(seacarb)


### Name: pHconv
### Title: Conversion of pH
### Aliases: pHconv
### Keywords: utilities

### ** Examples

##To convert pH=8.10 from the seawater scale to the total scale
##at salinity=35, temperature=25oC and atmospheric pressure:

  pHc <- pHconv(flag=1, pH=8.10, S=35, T=25, P=0, ks="d")

##note that pHc is the value of the pH converted in total scale

## By using vectors
## to convert the pH values : 8, 8.05, 8.10, 8.15, 8.20 
## from the free to the total scale

pH <- c(8, 8.05, 8.10, 8.15, 8.20)
pHc <- pHconv(flag=2, pH=pH, S=35, T=25, P=0, ks="d")

## note that pHc is a vector containing the value of the pH converted 
## to the total scale



