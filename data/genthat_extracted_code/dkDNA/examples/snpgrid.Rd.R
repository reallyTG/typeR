library(dkDNA)


### Name: snpgrid
### Title: Diffusion kernels on SNP genotypes
### Aliases: snpgrid
### Keywords: graphs nonparametric

### ** Examples

# set a seed
set.seed(4321)

# create a genotype matrix of 5 individuals with 10 SNPs
X <- matrix(sample(c(0,1,2), 50, prob=c(0.35, 0.3, 0.35), replace=TRUE),
ncol=10)

# set the rate of diffusion equal to 1
theta <- 1

# compute a SNP grid kernel 
snpgrid(X, theta)



