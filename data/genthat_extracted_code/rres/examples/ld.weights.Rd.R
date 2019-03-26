library(rres)


### Name: ld.weights
### Title: LD weights
### Aliases: ld.weights

### ** Examples

# simulate genotypes of 500 individuals at 100 markers
nsnp = 100 # number of SNPs
freq = runif(nsnp, 0.05, 0.95)
nhaplo = 1000 # number of founder haplotypes
haplo.mat = sim.haplotype(freq, nhaplo)
geno.mat = t(sapply(c(1:500), function(x) 4 - haplo.mat[2*x-1,] - haplo.mat[2*x,]))

# compute unconstrained LD weights
ld.weights(geno.mat)



