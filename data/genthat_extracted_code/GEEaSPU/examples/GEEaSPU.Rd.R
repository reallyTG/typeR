library(GEEaSPU)


### Name: GEEaSPU
### Title: An adaptive sum of powered score (SPU) test for single SNP and
###   mutiple phenotypes
### Aliases: GEEaSPU
### Keywords: SNP based multiple phenotypes

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
X <- matrix(rnorm(n.traits * n.subjects), n.subjects)
pheno <- X %*% diag(sqrt(pmax(ev, 0)), ncol(Sigma)) %*% eS$vectors


# -- simulating genotype
geno <- rbinom(n = n.subjects, size = 2, prob = 0.2)


# -- Computing the p-value of GEEaSPU test with the permutation based method
Pvl <- GEEaSPU(pheno = pheno, geno = geno, Z = NULL, pow = c(1,2,4,Inf), 
        n.perm = 1000, null.type = "perm", score.test = FALSE)


# -- Each element of Pvl is a p value of GEE-SPU(pow) in order
# -- The last element of Pvl is a p value of GEE-aSPU test
Pvl
Pvl[length(Pvl)]


# > Pvl
#     SPU.1     SPU.2     SPU.4   SPU.Inf      aSPU 
# 0.1890000 0.4070000 0.3520000 0.3040000 0.2917083 


# > Pvl[length(Pvl)]
#      aSPU 
# 0.2917083



