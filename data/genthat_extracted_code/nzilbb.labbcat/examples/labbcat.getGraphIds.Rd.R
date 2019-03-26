library(nzilbb.labbcat)


### Name: labbcat.getGraphIds
### Title: Gets a list of graph IDs.
### Aliases: labbcat.getGraphIds
### Keywords: graph transcript

### ** Examples

## Connect to LaBB-CAT
labbcat <- labbcat.instance("https://labbcat.canterbury.ac.nz/demo/", "demo", "demo")

## List all transcripts
transcripts <- labbcat.getGraphIds(labbcat)




