library(POMaSPU)


### Name: POMaSPU
### Title: An adaptive sum of powered score (SPU) test for single SNP and
###   mutiple phenotypes
### Aliases: POMaSPU
### Keywords: SNP based multiple phenotypes Proportional odds model

### ** Examples

# Example 1) 
# -- simulating phenotypes
# -- n.subjects: number of subjects
# -- n.traits: number of phenotypes

set.seed(136)
n.subjects <- 100
n.traits <- 10
pheno <- matrix(rnorm(n.subjects*n.traits), n.subjects, n.traits)


# -- simulating genotype (Y) and covariates (Z)
Y <- sample(c(0,1,2), n.subjects, replace = TRUE)
Z <- matrix(rnorm(n.subjects*2, 2, 1), n.subjects, 2)

# -- Computing the p-value of POMaSPU test with the permutation based method
Pvl <- POMaSPU(Y = Y, Y.level = c(0,1,2), pheno = pheno, Z = Z,  pow = c(1,2,4,Inf), n.perm = 1000)


# -- Each element of Pvl is a p value of POM-SPU(pow) in order
# -- The last element of Pvl is a p value of POM-aSPU test
Pvl
Pvl[length(Pvl)]


# > Pvl
#     SPU.1     SPU.2     SPU.4   SPU.Inf      aSPU 
# 0.1800000 0.5010000 0.3220000 0.1720000 0.3506494 


# > Pvl[length(Pvl)]
#      aSPU
# 0.3506494



# Example 2) 
# n.subjects <- 100
# n.traits <- 10
# Y <- sample(c("Well", "Mild", "Sick"), n.subjects, replace = TRUE)
# pheno <- matrix(rnorm(n.subjects*n.traits), n.subjects, n.traits)
# Z <- matrix(rnorm(n.subjects*2, 2, 1), n.subjects, 2)
# Pvl <- POMaSPU(Y = Y, Y.level = c("Sick", "Mild",  "Well"), pheno = pheno, Z = Z,  
# 		 pow = c(1,2,4,Inf), n.perm = 1000)



