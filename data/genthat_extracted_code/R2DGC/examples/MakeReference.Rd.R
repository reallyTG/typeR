library(R2DGC)


### Name: MakeReference
### Title: This function takes input chromatof files from metabolite
###   standards and parses them into a dataframe of retention time indexed
###   standards that can be used as an input for ConsensusAlign function
### Aliases: MakeReference

### ** Examples

MakeReference(c(system.file("extdata", "Alanine_150226_1.txt", package="R2DGC"),
    system.file("extdata", "Serine_022715_1.txt", package="R2DGC")))



