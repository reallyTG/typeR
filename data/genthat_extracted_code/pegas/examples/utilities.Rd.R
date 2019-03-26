library(pegas)


### Name: utilities
### Title: Utily Functions for pegas
### Aliases: getPloidy getAlleles getGenotypes expand.genotype
###   proba.genotype is.snp is.phased unphase
### Keywords: manip

### ** Examples

data(jaguar)
X <- jaguar[, 1:2]
getAlleles(X)
getGenotypes(X)
expand.genotype(2)
expand.genotype(2, LETTERS[1:3])
expand.genotype(3, ploidy = 4)
proba.genotype() # classical HWE with 2 alleles
## an octoploid with a six-allele locus (1287 possible genotypes):
length(p <- proba.genotype(alleles = LETTERS[1:6], ploidy = 8))
max(p) # ~ 0.006
## back to the jaguar data:
s <- summary(X)
## allele counts from the first locus:
p <- s[[1]]$allele
## expected probabilities for the 136 possible genotypes...
proba.genotype(names(p), p/sum(p))
## ... to be compared with s[[1]]$genotype



