library(nzilbb.labbcat)


### Name: labbcat.getLayerIds
### Title: Gets a list of layer IDs.
### Aliases: labbcat.getLayerIds
### Keywords: layer

### ** Examples

## Connect to LaBB-CAT
labbcat <- labbcat.instance("https://labbcat.canterbury.ac.nz/demo/", "demo", "demo")

## Get names of all layers
layer.ids <- labbcat.getLayerIds(labbcat)




