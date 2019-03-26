library(nzilbb.labbcat)


### Name: labbcat.getLayer
### Title: Gets a layer definition.
### Aliases: labbcat.getLayer
### Keywords: layer

### ** Examples

## Connect to LaBB-CAT
labbcat <- labbcat.instance("https://labbcat.canterbury.ac.nz/demo/", "demo", "demo")

## Get the definition of the orthography layer
orthography.layer <- labbcat.getLayer(labbcat, "orthography")




