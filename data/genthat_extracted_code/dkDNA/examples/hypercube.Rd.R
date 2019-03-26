library(dkDNA)


### Name: hypercube
### Title: Diffusion kernels on bi-allelic genotypes
### Aliases: hypercube
### Keywords: graphs nonparametric

### ** Examples

# set a seed
set.seed(4321)

# create a genotype matrix of 5 individuals with 10 bi-allelic genotypes
X <- matrix(sample(c(0,1), 50, prob=c(0.6,0.4), replace=TRUE), ncol=10)

# set the rate of diffusion equal to 1
theta <- 1

# compute a hypercube kernel 
hypercube(X, theta)



