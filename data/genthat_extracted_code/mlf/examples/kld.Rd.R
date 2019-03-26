library(mlf)


### Name: kld
### Title: Kullback-Leibler Divergence
### Aliases: kld

### ** Examples

# Sample numeric vector
a <- rnorm(25, 80, 35)
b <- rnorm(25, 90, 35)
mlf::kld(a, b, bins = 2)

# Sample discrete vector
a <- as.factor(c(1,1,2,2))
b <- as.factor(c(1,1,1,2))
mlf::kld(a, b)



