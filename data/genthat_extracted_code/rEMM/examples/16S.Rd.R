library(rEMM)


### Name: 16S
### Title: Count Data for 16S rRNA Sequences
### Aliases: 16S Alphaproteobacteria16S Mollicutes16S
### Keywords: datasets

### ** Examples

data("16S")

emm <- EMM("Kullback", threshold=0.1)
build(emm, Mollicutes16S+1)

## start state for sequences have an initial state probability >0
it <- initial_transition(emm)
it[it>0]



