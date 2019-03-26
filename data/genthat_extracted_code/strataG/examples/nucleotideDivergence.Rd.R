library(strataG)


### Name: nucleotideDivergence
### Title: Nucleotide Divergence
### Aliases: nucleotideDivergence dA

### ** Examples

data(dolph.strata)
data(dolph.seqs)
strata <- dolph.strata$fine
names(strata) <- dolph.strata$ids
dloop <- sequence2gtypes(dolph.seqs, strata, seq.names = "dLoop")

nucleotideDivergence(dloop)




