library(nzilbb.labbcat)


### Name: labbcat.getParticipantIds
### Title: Gets a list of participant IDs.
### Aliases: labbcat.getParticipantIds
### Keywords: participant speaker

### ** Examples

## Connect to LaBB-CAT
labbcat <- labbcat.instance("https://labbcat.canterbury.ac.nz/demo/", "demo", "demo")

## List all speakers
speakers <- labbcat.getParticipantIds(labbcat)




