library(GEEaSPU)


### Name: GEEaSPUpath
### Title: An adaptive sum of powered score (SPU) test for gene-set
###   (pathway) and mutiple phenotypes
### Aliases: GEEaSPUpath
### Keywords: gene-set/pathway based multiple phenotypes

### ** Examples

# -- simulating phenotypes
# -- n.subjects: number of subjects
# -- n.traits: number of phenotypes
# -- Sigma: covariance matrix of phenotypes (e.g. AR(1))

set.seed(136)
n.subjects <- 100
n.traits <- 3
sigma <- 2; rho <- 0.5
Sigma0 <- diag(n.traits)
Sigma <- sigma * rho^abs(row(Sigma0) - col(Sigma0))
eS <- eigen(Sigma, symmetric = TRUE)
ev <- eS$values
X <- matrix(rnorm(n.subjects * n.traits), n.subjects)
pheno <- X %*% diag(sqrt(pmax(ev, 0)), ncol(Sigma)) %*% eS$vectors


# -- simulating genotype
# -- Assume we have two genes each of which has 3 and 5 SNPs respectively.
# -- n.geno1: number of SNPs included in the gene1
# -- n.geno2: number of SNPs included in the gene2
# -- nSNPs <- c(3,5)

n.geno1 <- 3
n.geno2 <- 5
maf1 <- 0.2
maf2 <- 0.4
gene1 <- matrix(rbinom(n = n.subjects*n.geno1, size = 2, prob = maf1), ncol = n.geno1)
gene2 <- matrix(rbinom(n = n.subjects*n.geno2, size = 2, prob = maf2), ncol = n.geno2)
geno <- cbind(gene1, gene2)


# -- Computing the p-value of GEEaSPUpath test
Pvl <- GEEaSPUpath(pheno = pheno, geno = geno, nSNPs = c(3,5), Z = NULL, 
        corstr = "independence", pow = c(1,4,8), pow2 = c(1,4,8), 
        pow3 = c(1,4,8), n.perm = 1000)


# -- Each element of Pvl is a p value of GEE-SPU(pow,pow2,pow3) in order
# -- The last element of Pvl is a p value of GEE-aSPUpath test
Pvl
Pvl[length(Pvl)]


# > Pvl
# SPU.1.1.1  SPU.1.1.4  SPU.1.1.8  SPU.1.4.1  SPU.1.4.4  SPU.1.4.8  SPU.1.8.1  SPU.1.8.4 
# 0.00900000 0.05600000 0.07000000 0.06200000 0.08300000 0.11200000 0.06100000 0.08200000 
#  SPU.1.8.8  SPU.4.1.1  SPU.4.1.4  SPU.4.1.8  SPU.4.4.1  SPU.4.4.4  SPU.4.4.8  SPU.4.8.1 
# 0.10600000 0.58100000 0.54300000 0.49200000 0.62400000 0.64000000 0.62700000 0.64900000 
#  SPU.4.8.4  SPU.4.8.8  SPU.8.1.1  SPU.8.1.4  SPU.8.1.8  SPU.8.4.1  SPU.8.4.4  SPU.8.4.8 
# 0.67100000 0.67500000 0.58300000 0.53700000 0.48100000 0.63400000 0.64600000 0.63800000 
#  SPU.8.8.1  SPU.8.8.4  SPU.8.8.8   aSPUpath 
# 0.66000000 0.68100000 0.67900000 0.04395604 


# > Pvl[length(Pvl)]
#   aSPUpath 
# 0.04395604 



