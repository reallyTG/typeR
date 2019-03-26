library(bnpsd)


### Name: rbnpsd
### Title: Simulate random allele frequencies and genotypes from the BN-PSD
###   admixture model
### Aliases: rbnpsd

### ** Examples

# dimensions
m <- 10 # number of loci
n <- 5 # number of individuals
k <- 2 # number of intermediate subpops

# define population structure
F <- c(0.1, 0.3) # FST values for k=2 subpopulations
sigma <- 1 # dispersion parameter of intermediate subpops
Q <- q1d(n, k, sigma) # admixture proportions from 1D geography

# draw all random allele freqs and genotypes
out <- rbnpsd(Q, F, m)
X <- out$X # genotypes
P <- out$P # IAFs
B <- out$B # Intermediate AFs
pAnc <- out$Pa # Ancestral AFs




