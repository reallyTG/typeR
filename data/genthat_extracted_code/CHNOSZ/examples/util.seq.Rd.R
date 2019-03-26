library(CHNOSZ)


### Name: util.seq
### Title: Functions to Work with Sequence Data
### Aliases: util.seq aminoacids nucleic.formula nucleic.complement

### ** Examples
## Don't show: 
data(thermo)
## End(Don't show)
## count nucleobases in a sequence
bases <- count.aa("ACCGGGTTT", type="DNA")
# the DNA complement of that sequence
DNA.comp <- nucleic.complement(bases)
# the RNA complement of the DNA complement
RNA.comp <- nucleic.complement(DNA.comp, type="RNA")
# the formula of the RNA complement (bases only)
nucleic.formula(RNA.comp)  # C40H42N32O11



