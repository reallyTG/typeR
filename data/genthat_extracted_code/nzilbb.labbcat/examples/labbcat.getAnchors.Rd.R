library(nzilbb.labbcat)


### Name: labbcat.getAnchors
### Title: Gets the given anchors in the given graph.
### Aliases: labbcat.getAnchors
### Keywords: anchor

### ** Examples

## Connect to LaBB-CAT
labbcat <- labbcat.instance("https://labbcat.canterbury.ac.nz/demo/", "demo", "demo")

## Get the first 20 orthography tokens in UC427_ViktoriaPapp_A_ENG.eaf
orthography <- labbcat.getAnnotations(labbcat, "UC427_ViktoriaPapp_A_ENG.eaf", "orthography", 20, 0)

## Get the start anchors the above tokens
word.starts <- labbcat.getAnchors(labbcat, "UC427_ViktoriaPapp_A_ENG.eaf", orthography$startId)




