library(STMotif)


### Name: intensityDataset
### Title: Plot the intensity of values
### Aliases: intensityDataset

### ** Examples

#Launch all the workflow
#Plot the result
D  <- STMotif::example_dataset
DS <- NormSAX(STMotif::example_dataset,7)
stmotifs <- SearchSTMotifs(D,DS,3,7,10,10,3,7)
rstmotifs <- RankSTMotifs(stmotifs)
intensityDataset(dataset = STMotif::example_dataset, rankList = rstmotifs,  7)



