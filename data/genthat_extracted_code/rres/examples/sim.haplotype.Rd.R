library(rres)


### Name: sim.haplotype
### Title: Simulate artificial haplotypes.
### Aliases: sim.haplotype

### ** Examples

nsnp = 7 # number of SNPs
freq = runif(nsnp, 0.05, 0.95)
nhaplo = 4 # number of founder haplotypes
sim.haplotype(freq, nhaplo)



