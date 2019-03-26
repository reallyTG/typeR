library(BlockFeST)


### Name: calcPval
### Title: Calculates empirical P-values
### Aliases: calcPval
### Keywords: methods

### ** Examples


snps   <- system.file("extdata", "snps.txt", package="BlockFeST")
groups <- system.file("extdata", "groups.txt", package="BlockFeST")
BlockFeST.result <- BlockFeST(input=snps, GROUP=groups, nb=3, runtime=10)
P <- calcPval(BlockFeST.result)




