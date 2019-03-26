library(MoLE)


### Name: FUSE
### Title: Fuse words
### Aliases: FUSE
### Keywords: misc

### ** Examples

FOUND()
agent=population[[1]]
agent$collostructions$flag[1,]$N=agent$nouns$ID[nrow(agent$nouns)-1]
agent$collostructions$flag[1,]$marker=agent$nouns$ID[nrow(agent$nouns)]
agent$collostructions$flag[1,]$frequency=100
agent$nouns[nrow(agent$nouns),]$nounMarker=100
agent$nouns[nrow(agent$nouns)-1,]$person=1
agent$nouns[nrow(agent$nouns),6:9]=NA
agent$collostructions$flag
tail(agent$nouns)

agent=FUSE(agent)
agent$collostructions$flag
tail(agent$nouns)



