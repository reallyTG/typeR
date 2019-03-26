library(aSPU)


### Name: GEEaSPU
### Title: The SPU and aSPU tests for multiple traits - single SNP
###   association in generalized estimating equations.
### Aliases: GEEaSPU

### ** Examples


traits <- matrix(rnorm(100*5, 0,1), ncol=5)
Z <- rnorm(100, 2, 0.5)
geno <- rbinom(100, 2, 0.5)
out <- GEEaSPU(traits, geno, Z = NULL, model = "gaussian", 
	  gamma = c(1:8,Inf), n.sim = 100)




