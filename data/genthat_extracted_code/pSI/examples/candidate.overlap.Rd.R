library(pSI)


### Name: candidate.overlap
### Title: Candidate Gene Overlap
### Aliases: candidate.overlap

### ** Examples

##load sample pSI output
data(sample.data)
##load sample candidate gene lists
data(candidate.genes)
##Generates lists of overlapping genes
candidate.gene.overlap.AutDB <- candidate.overlap(pSIs=sample.data$pSI.output,
                                                 candidate.genes=candidate.genes$AutDB)



