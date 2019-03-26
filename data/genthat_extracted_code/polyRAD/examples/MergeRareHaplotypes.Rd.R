library(polyRAD)


### Name: MergeRareHaplotypes
### Title: Consolidate Reads from Rare Alleles
### Aliases: MergeRareHaplotypes MergeRareHaplotypes.RADdata
### Keywords: manip methods

### ** Examples

data(exampleRAD)
exampleRAD2 <- MergeRareHaplotypes(exampleRAD, 
                                   min.ind.with.haplotype = 12)
exampleRAD$alleleDepth[21:30,3:5]
exampleRAD2$alleleDepth[21:30,3:4]
exampleRAD$alleleNucleotides
exampleRAD2$alleleNucleotides



