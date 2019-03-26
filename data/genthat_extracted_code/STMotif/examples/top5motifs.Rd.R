library(STMotif)


### Name: top5motifs
### Title: Plot the 5 motifs
### Aliases: top5motifs

### ** Examples

#Launch all the workflow
D  <- STMotif::example_dataset
DS <- NormSAX(STMotif::example_dataset,7)
stmotifs <- SearchSTMotifs(D,DS,3,7,10,10,3,7)
rstmotifs <- RankSTMotifs(stmotifs)
#Plot the result
top5motifs(dataset = STMotif::example_dataset, rankList = rstmotifs, alpha = 7)



