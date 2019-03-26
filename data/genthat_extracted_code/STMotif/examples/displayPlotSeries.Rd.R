library(STMotif)


### Name: displayPlotSeries
### Title: Plot spatial series by selected columns
### Aliases: displayPlotSeries

### ** Examples

#Launch all the workflow
#Plot the result
D  <- STMotif::example_dataset
DS <- NormSAX(STMotif::example_dataset,7)
stmotifs <- SearchSTMotifs(D,DS,3,7,10,10,3,7)
rstmotifs <- RankSTMotifs(stmotifs)
displayPlotSeries(dataset = D, rmotifs = rstmotifs ,position = 1 ,space = c(1,2,5:7))



