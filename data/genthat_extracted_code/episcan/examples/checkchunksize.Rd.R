library(episcan)


### Name: checkchunksize
### Title: Check chunk size
### Aliases: checkchunksize

### ** Examples

set.seed(123)
geno1 <- matrix(sample(0:2, size = 1000, replace = TRUE, prob = c(0.5, 0.3, 0.2)), 
ncol = 10)
geno2 <- matrix(sample(0:2, size = 2000, replace = TRUE, prob = c(0.4, 0.3, 0.3)), 
ncol = 20)

# if chunk size is smaller, there is no problem
chunksize <- 10
checkchunksize(chunksize, ncol(geno1))

# if chunk size is bigger than the number of columns in genotype input, 
# set chunk size equal to the number of columns in genotype input
chuksize <- 12
checkchunksize(chunksize, ncol(geno1))

# if chunk size is bigger than the number of columns of geno1 and geno2, 
# set chunk size equal to the minima nunumber of columns of geno1 and geno2
chunksize <- 50
checkchunksize(chunksize, ncol(geno1), ncol(geno2))



