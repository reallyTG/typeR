library(geoR)


### Name: boxcox.geodata
### Title: Box-Cox transformation for geodata objects
### Aliases: boxcox.geodata
### Keywords: regression models hplot

### ** Examples

if(require(MASS)){
boxcox(wolfcamp)

data(ca20)
boxcox(ca20, trend = ~altitude)
}



