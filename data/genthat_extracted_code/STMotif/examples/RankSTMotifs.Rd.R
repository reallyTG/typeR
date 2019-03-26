library(STMotif)


### Name: RankSTMotifs
### Title: Rank the STmotifs Rank motifs by their quality
### Aliases: RankSTMotifs

### ** Examples

#Search for Spatial-time Motifs
D  <- STMotif::example_dataset
DS <- NormSAX(STMotif::example_dataset,7)
stmotifs <- SearchSTMotifs(D,DS,3,7,10,10,3,7)
rstmotifs <- RankSTMotifs(stmotifs)



