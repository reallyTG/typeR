library(gglogo)


### Name: calcInformation
### Title: Compute shannon information based on position and treatment
### Aliases: calcInformation

### ** Examples

data(sequences)
dm2 <- splitSequence(sequences, "peptide")
dm3 <- calcInformation(dm2, pos="position", trt="class", elems="element", k=21)
# precursor to a logo plot:
library(ggplot2)
# library(biovizBase)




