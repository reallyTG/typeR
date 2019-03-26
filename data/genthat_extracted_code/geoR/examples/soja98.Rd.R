library(geoR)


### Name: soja98
### Title: Soya bean production and other variables in a uniformity trial
### Aliases: soja98
### Keywords: datasets

### ** Examples

data(soja98)
plot(soja98)
require(geoR)
prod98 <- as.geodata(soja98, coords.col=1:2, data.col=)
plot(prod98, low=TRUE)



