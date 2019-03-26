library(rEMM)


### Name: update
### Title: Update a TRACDS temporal structure with new state assignements
### Aliases: update update,TRACDS-method reset reset,TRACDS-method compact
###   compact,TRACDS-method
### Keywords: models

### ** Examples

## create an empty TRACDS object
tracds <- TRACDS()
tracds

## update with an cluster assignment sequence
update(tracds, c(1,2,5,5,2))
tracds

plot(tracds)



