library(strataG)


### Name: nucleotideDiversity
### Title: Nucleotide Diversity
### Aliases: nucleotideDiversity

### ** Examples

data(dolph.strata)
data(dolph.seqs)
strata <- dolph.strata$fine
names(strata) <- dolph.strata$ids
dloop <- sequence2gtypes(dolph.seqs, strata, seq.names = "dLoop")

nucleotideDiversity(dloop)




