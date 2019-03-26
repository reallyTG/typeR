library(pegas)


### Name: all.equal.haploNet
### Title: Compare Two Haplotype Networks
### Aliases: all.equal.haploNet
### Keywords: models

### ** Examples

data(woodmouse)
d <- dist.dna(woodmouse, "n")
nt1 <- mst(d)
nt2 <- msn(d)
(comp <- all.equal(nt1, nt2)) # clearly different

## how to use all.equal to return TRUE/FALSE:
isTRUE(comp) # FALSE



