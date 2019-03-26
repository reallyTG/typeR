library(nzilbb.labbcat)


### Name: labbcat.getAnnotations
### Title: Gets the annotations on the given layer of the given graph.
### Aliases: labbcat.getAnnotations
### Keywords: graph transcript

### ** Examples

## Connect to LaBB-CAT
labbcat <- labbcat.instance("https://labbcat.canterbury.ac.nz/demo/", "demo", "demo")

## Get all the orthography tokens in UC427_ViktoriaPapp_A_ENG.eaf
orthography <- labbcat.getAnnotations(labbcat, "UC427_ViktoriaPapp_A_ENG.eaf", "orthography")

## Get the first 20 orthography tokens in UC427_ViktoriaPapp_A_ENG.eaf
orthography <- labbcat.getAnnotations(labbcat, "UC427_ViktoriaPapp_A_ENG.eaf", "orthography", 20, 0)




