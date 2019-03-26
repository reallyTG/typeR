library(IBDsim)


### Name: alleleSummary
### Title: Allele sharing summary
### Aliases: alleleSummary
### Keywords: math

### ** Examples

### Sibling simulation (3 sims of chromosomes 1 and 2)
x = nuclearPed(2)
sim = IBDsim(x, sims=3, chromosomes=1:2)

alleleSummary(sim[[1]]) # First sim, summary of all individuals
alleleSummary(sim[[1]], ids=3:4) # Summary of the siblings
alleleSummary(sim[[1]], ids=3:4, ibd.status=TRUE) # IBD breakdown of the siblings

# Trivial example: Summary of the father.
# Being the first founder, his alleles are denoted 1 and 2 everywhere.
fa = alleleSummary(sim[[1]], ids=1) 
stopifnot(all(fa[,c('1p', '1m')]==c(1,1,2,2)))




