library(polyRAD)


### Name: SubsetByLocus
### Title: Create RADdata Objects with a Subset of Loci
### Aliases: SubsetByLocus SubsetByLocus.RADdata SplitByChromosome
###   SplitByChromosome.RADdata RemoveMonomorphicLoci
###   RemoveMonomorphicLoci.RADdata RemoveHighDepthLoci
###   RemoveHighDepthLoci.RADdata
### Keywords: manip

### ** Examples

# load a dataset for this example
data(exampleRAD)
exampleRAD

# just keep the first and fourth locus
subsetRAD <- SubsetByLocus(exampleRAD, c(1, 4))
subsetRAD

# split by groups of chromosomes
exampleRAD$locTable
tf <- tempfile()
splitfiles <- SplitByChromosome(exampleRAD, list(c(1, 4), c(6, 9)),
                                fileprefix = tf)
load(splitfiles[1])
splitRADdata

# filter out monomorphic loci (none removed in example)
filterRAD <- RemoveMonomorphicLoci(exampleRAD)

# filter out high depth loci (none removed in this example)
filterRAD2 <- RemoveHighDepthLoci(filterRAD)



