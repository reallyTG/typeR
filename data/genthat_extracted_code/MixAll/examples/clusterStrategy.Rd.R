library(MixAll)


### Name: clusterStrategy
### Title: A strategy is a multistage empirical process for finding a good
###   estimate in the clustering estimation process.
### Aliases: clusterStrategy clusterSemiSEMStrategy clusterSEMStrategy
###   clusterFastStrategy

### ** Examples

   clusterStrategy()
   clusterStrategy(longRunAlgo= "CEM", nbLongIteration=100)
   clusterStrategy(nbTry = 1, nbInit= 1, shortRunAlgo= "SEM", nbShortIteration=100)

   clusterSemiSEMStrategy()

   clusterSEMStrategy()

   clusterFastStrategy()




