library(pSI)


### Name: fisher.iteration
### Title: Fisher's Exact Test Across All Cell Types & pSI Thresholds
### Aliases: fisher.iteration

### ** Examples

##load sample pSI output
data(sample.data)
##load sample candidate gene lists
data(candidate.genes)
##run Fisher's exact test for overrperesentation on pSI.out for the AutDB
##candidate gene list across all cell types/sample types & pSI thresholds
fisher.out.AutDB <- fisher.iteration(pSIs=sample.data$pSI.output,
                                         candidate.genes=candidate.genes$AutDB)



