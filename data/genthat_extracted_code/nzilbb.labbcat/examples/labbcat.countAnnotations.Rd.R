library(nzilbb.labbcat)


### Name: labbcat.countAnnotations
### Title: Gets the number of annotations on the given layer of the given
###   graph.
### Aliases: labbcat.countAnnotations
### Keywords: graph transcript

### ** Examples

## Connect to LaBB-CAT
labbcat <- labbcat.instance("https://labbcat.canterbury.ac.nz/demo/", "demo", "demo")

## Count the number of words in UC427_ViktoriaPapp_A_ENG.eaf
token.count <- labbcat.countAnnotations(labbcat, "UC427_ViktoriaPapp_A_ENG.eaf", "orthography")




