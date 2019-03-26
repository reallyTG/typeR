library(adehabitatMA)


### Name: adeoptions
### Title: Setting options for the adehabitat* package
### Aliases: adeoptions
### Keywords: environment

### ** Examples


## load the data
data(lynxjura)

## short printing method
oldopt <- adeoptions(shortprint=TRUE)

lynxjura$map

## 'sp' print method for Spatial objects
adeoptions(shortprint=FALSE)

lynxjura$map

## original options
adeoptions(oldopt)

lynxjura$map





