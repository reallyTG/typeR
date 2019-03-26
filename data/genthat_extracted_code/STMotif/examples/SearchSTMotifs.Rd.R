library(STMotif)


### Name: SearchSTMotifs
### Title: SearchSTMotifs
### Aliases: SearchSTMotifs

### ** Examples

#Search for Spatial-time Motifs
D  <- STMotif::example_dataset
DS <- NormSAX(STMotif::example_dataset,7)
stmotifs <- SearchSTMotifs(D,DS,3,7,10,10,3,7)



