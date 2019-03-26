library(GEEaSPU)


### Name: GEEaSPUset
### Title: An adaptive sum of powered score (SPU) test for SNP-set (gene)
###   and mutiple phenotypes
### Aliases: GEEaSPUset
### Keywords: SNP-set/gene based multiple phenotypes

### ** Examples

# -- simulating phenotypes
# -- n.subjects: number of subjects
# -- n.traits: number of phenotypes
# -- Sigma: covariance matrix of phenotypes (e.g. AR(1))

set.seed(136)
n.subjects <- 100
n.traits <- 3
sigma <- 2; rho <- 0.5
Sigma0 <- diag(n.traits); 
Sigma <- sigma * rho^abs(row(Sigma0) - col(Sigma0))
eS <- eigen(Sigma, symmetric = TRUE)
ev <- eS$values
X <- matrix(rnorm(n.subjects * n.traits), n.subjects)
pheno <- X %*% diag(sqrt(pmax(ev, 0)), ncol(Sigma)) %*% eS$vectors


# -- simulating genotype
# -- n.geno: number of SNPs included in the SNP set/gene

n.geno <- 3
maf <- 0.2
geno <- matrix(rbinom(n = n.subjects * n.geno, size = 2, prob = maf), ncol = n.geno)


# -- Computing the p-value of GEEaSPUpath test with the permutation based method
Pvl <- GEEaSPUset(pheno = pheno, geno = geno, Z = NULL, model = "gaussian", 
        corstr = "independence", pow = c(1,4,Inf), pow2 = c(1,4,Inf), n.perm = 1000,         
        null.type = "perm", score.test = FALSE)


# -- Each element of Pvl is a p value of GEE-SPU(pow,pow2) in order
# -- The last element of Pvl is a p value of GEE-aSPUset test
Pvl
Pvl[length(Pvl)]


# > Pvl
#     SPU.1.1     SPU.1.4   SPU.1.Inf     SPU.4.1     SPU.4.4   SPU.4.Inf   SPU.Inf.1 
#  0.01400000  0.08800000  0.07200000  0.53000000  0.41000000  0.32100000  0.55100000 
#   SPU.Inf.4 SPU.Inf.Inf     aSPUset 
#  0.48700000  0.41000000  0.04095904 
 
 
# > Pvl[length(Pvl)]
#    aSPUset 
# 0.04095904



