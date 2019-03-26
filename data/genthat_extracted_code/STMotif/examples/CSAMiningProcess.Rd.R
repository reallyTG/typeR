library(STMotif)


### Name: CSAMiningProcess
### Title: CSAMiningProcess
### Aliases: CSAMiningProcess

### ** Examples

#CSA Datamining process
D  <- STMotif::example_dataset
DS <- NormSAX(STMotif::example_dataset,7)
rmotif <- CSAMiningProcess(D,DS,3,7,10,10,3,7)



