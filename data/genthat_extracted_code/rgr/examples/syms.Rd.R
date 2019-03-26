library(rgr)


### Name: syms
### Title: Function to Compute the Diameters of Proportional Symbols
### Aliases: syms
### Keywords: hplot

### ** Examples
 
## Make test data available
data(kola.o)
attach(kola.o)

## Compute default symbol diameters
circle.diam <- syms(Cu, p = 0.3)
circle.diam

## Compute symbol diameters holding all symbols for values greater 
## than 1000 to the same size
circle.diam <- syms(Cu, zrange = c(NA, 1000), p = 0.3)
circle.diam 

## Clean-up and detach test data
rm(circle.diam)
detach(kola.o)



