library(bnpsd)


### Name: rgeno
### Title: Draw genotypes from the admixture model
### Aliases: rgeno

### ** Examples

# dimensions
m <- 10 # number of loci
n <- 5 # number of individuals
k <- 2 # number of intermediate subpops

# define population structure
F <- c(0.1, 0.3) # FST values for k=2 subpops
sigma <- 1 # dispersion parameter of intermediate subpops
Q <- q1d(n, k, sigma) # non-trivial admixture proportions

# draw alelle frequencies
pAnc <- rpanc(m) # random vector of ancestral allele frequencies
B <- rpint(pAnc, F) # matrix of intermediate subpop allele freqs
P <- rpiaf(B,Q) # matrix of individual-specific allele frequencies

# draw genotypes from intermediate subpops (one individual each)
Xb <- rgeno(B)
# and genotypes for admixed individuals
Xp <- rgeno(P)




