library(bnpsd)


### Name: rpiaf
### Title: Construct individual-specific allele frequency matrix
### Aliases: rpiaf

### ** Examples

m <- 10 # number of loci
n <- 5 # number of individuals
k <- 2 # number of intermediate subpops
pAnc <- rpanc(m) # random vector of ancestral allele frequencies
F <- c(0.1, 0.3) # FST values for k=2 subpops
B <- rpint(pAnc, F) # matrix of intermediate subpop allele freqs
sigma <- 1 # dispersion parameter of intermediate subpops
Q <- q1d(n, k, sigma) # non-trivial admixture proportions
P <- rpiaf(B,Q)




