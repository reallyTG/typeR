library(mipfp)


### Name: Corr2Odds
### Title: Converting correlation to odds ratio
### Aliases: Corr2Odds
### Keywords: multivariate array

### ** Examples

# correlation matrix from Qaqish et al. (2012)
cr <- matrix(c( 1.000, -0.215, 0.144, 0.107,
               -0.215,  1.000, 0.184, 0.144,
                0.144,  0.184, 1.000, 0.156,
                0.107,  0.144, 0.156, 1.000), nrow = 4, ncol = 4, byrow = TRUE)
rownames(cr) <- colnames(cr) <- c("Parent1", "Parent2", "Sibling1", "Sibling2")

# hypothetical marginal probabilities
p <- c(0.2, 0.4, 0.6, 0.8)

# converting correlation to odds ratio and getting pairwise probabilities
or <- Corr2Odds(corr = cr, marg.probs = p)
print(or)



