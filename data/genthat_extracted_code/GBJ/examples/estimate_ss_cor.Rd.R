library(GBJ)


### Name: estimate_ss_cor
### Title: estimate_ss_cor.R
### Aliases: estimate_ss_cor

### ** Examples

ref_pcs <- matrix(data=runif(n=1000, min=-0.2, max=0.2), ncol=5)
ref_genotypes <- matrix(data=rbinom(n=2000, size=2, prob=0.3), ncol=10)
estimate_ss_cor(ref_pcs=ref_pcs, ref_genotypes=ref_genotypes, link_function="linear")



