library(geneSignatureFinder)


### Name: goodAndPoorClassification
### Title: Function to classify the unsupervised clusters found through a
###   classification procedure in good and poor groups of samples.
### Aliases: goodAndPoorClassification

### ** Examples

data(geNSCLC)
geData <- geNSCLC

data(stNSCLC)
stData <- stNSCLC
######################
randomClustering  <- runif(nrow(stData)) > .5
survdiff(stData ~ randomClustering)
###############
clusteringByPrognosis <- goodAndPoorClassification(randomClustering)
survdiff(stData ~ clusteringByPrognosis)



