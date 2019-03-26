library(abd)


### Name: GreatTitMalaria
### Title: Malaria in Populations of Great Tit
### Aliases: GreatTitMalaria
### Keywords: datasets

### ** Examples

str(GreatTitMalaria)

table(GreatTitMalaria)

if(require(vcd)) {
  mosaic(~treatment + response, GreatTitMalaria)
}



