library(R2DGC)


### Name: ConsensusAlign
### Title: Takes a vector of paths to input files and aligns common
###   metabolites into a final table.  Will also identify metabolites if a
###   reference library is provided
### Aliases: ConsensusAlign

### ** Examples

ConsensusAlign(c(system.file("extdata", "SampleA.txt", package="R2DGC"),
    system.file("extdata", "SampleB.txt", package="R2DGC")), RT1_Standards= c())



