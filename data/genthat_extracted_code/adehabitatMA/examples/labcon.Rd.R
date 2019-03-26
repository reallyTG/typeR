library(adehabitatMA)


### Name: labcon
### Title: Labelling Connected Features
### Aliases: labcon
### Keywords: spatial

### ** Examples


data(lynxjura)
sa <- lynxjura$map[,1]

## build an image with separate components
sa[[1]][sa[[1]]<50] <- NA

## show the connected components
image(sa)
image(labcon(sa))





