library(nzilbb.labbcat)


### Name: labbcat.getLayers
### Title: Gets a list of layer definitions.
### Aliases: labbcat.getLayers
### Keywords: layer

### ** Examples

## Connect to LaBB-CAT
labbcat <- labbcat.instance("https://labbcat.canterbury.ac.nz/demo/", "demo", "demo")

## Get definitions of all layers
layers <- labbcat.getLayerIds(labbcat)




