library(strataG)


### Name: sequence2gtypes
### Title: Convert Sequences To 'gtypes'
### Aliases: sequence2gtypes

### ** Examples

#--- create a haploid sequence (mtDNA) gtypes object
data(dolph.strata)
data(dolph.seqs)
strata <- dolph.strata$fine
names(strata) <- dolph.strata$ids
dloop.fine <- sequence2gtypes(dolph.seqs, strata, seq.names = "dLoop", 
description = "dLoop: fine-scale stratification")




