library(mipfp)


### Name: Corr2PairProbs
### Title: Converting correlation to pairwise probability
### Aliases: Corr2PairProbs
### Keywords: multivariate array

### ** Examples

# correlation matrix from Qaqish et al. (2012)
corr <- matrix(c( 1.000, -0.215, 0.144, 0.107,
                 -0.215,  1.000, 0.184, 0.144,
                  0.144,  0.184, 1.000, 0.156,
                  0.107,  0.144, 0.156, 1.000), 
                  nrow = 4, ncol = 4, byrow = TRUE)
rownames(corr) <- colnames(corr) <- c("Parent1", "Parent2", "Sibling1", 
                                      "Sibling2")

# hypothetical marginal probabilities
p <- c(0.2, 0.4, 0.6, 0.8)

# getting the pairwise probabilities
pp <- Corr2PairProbs(cor = corr, marg.probs = p)
print(pp)



