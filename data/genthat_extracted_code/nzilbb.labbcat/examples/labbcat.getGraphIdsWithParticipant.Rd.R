library(nzilbb.labbcat)


### Name: labbcat.getGraphIdsWithParticipant
### Title: Gets a list of IDs of graphs that include the given participant.
### Aliases: labbcat.getGraphIdsWithParticipant
### Keywords: graph transcript

### ** Examples

## Connect to LaBB-CAT
labbcat <- labbcat.instance("https://labbcat.canterbury.ac.nz/demo/", "demo", "demo")

## List transcripts in which UC427_ViktoriaPapp_A_ENG speaks
transcripts <- labbcat.getGraphIdsWithParticipant(labbcat, "UC427_ViktoriaPapp_A_ENG")




