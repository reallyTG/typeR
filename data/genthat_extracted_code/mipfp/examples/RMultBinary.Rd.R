library(mipfp)


### Name: RMultBinary
### Title: Simulating a multivariate Bernoulli distribution
### Aliases: RMultBinary Bernoulli RMultBernoulli
### Keywords: multivariate distribution datagen

### ** Examples

# from Qaqish et al. (2012)
or <- matrix(c(Inf, 0.281, 2.214, 2.214,
               0.281, Inf, 2.214, 2.214,
               2.214, 2.214, Inf, 2.185,
               2.214, 2.214, 2.185, Inf), nrow = 4, ncol = 4, byrow = TRUE)
rownames(or) <- colnames(or) <- c("Parent1", "Parent2", "Sibling1", "Sibling2")

# hypothetical marginal probabilities
p <- c(0.2, 0.4, 0.6, 0.8)

# estimating the joint-distribution
p.joint <- ObtainMultBinaryDist(odds = or, marg.probs = p)

# simulating 100,000 draws from the obtained joint-distribution
y.sim <- RMultBinary(n = 1e5, mult.bin.dist = p.joint)$binary.sequences

# checking results
cat('dim y.sim =', dim(y.sim)[1], 'x', dim(y.sim)[2], '\n')
cat('Estimated marginal probs from simulated data\n')
apply(y.sim,2,mean)
cat('True probabilities\n')
print(p)
cat('Estimated correlation from simulated data\n')
cor(y.sim)
cat('True correlation\n')
Odds2Corr(or,p)$corr

# generating binary outcomes with outcome different than 0, 1
RMultBinary(n = 10, mult.bin.dist = p.joint, 
            target.values = list(c("A", "B"), c(0, 1), c(1, 2), c(100, 101)))



