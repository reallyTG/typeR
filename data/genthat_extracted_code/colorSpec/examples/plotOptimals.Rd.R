library(colorSpec)


### Name: plotOptimals
### Title: Plot Optimal Colors
### Aliases: plotOptimals3D plotOptimals3D.colorSpec
### Keywords: colorSpec

### ** Examples
## No test: 
# requires package rgl
library( rgl )
human = product( D50.5nm, 'slot', xyz1931.5nm, wave=400:770 )
plotOptimals3D( human )
scanner = product( D50.5nm, 'slot', BT.709.RGB, wave=400:770 )
plotOptimals3D( scanner )

## End(No test)


