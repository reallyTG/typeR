library(mipfp)


### Name: Odds2Corr
### Title: Converting odds ratio to correlation
### Aliases: Odds2Corr
### Keywords: multivariate array

### ** Examples

# from Qaqish et al. (2012)
or <- matrix(c(Inf, 0.281, 2.214, 2.214,
               0.281, Inf, 2.214, 2.214,
               2.214, 2.214, Inf, 2.185,
               2.214, 2.214, 2.185, Inf), nrow = 4, ncol = 4, byrow = TRUE)
rownames(or) <- colnames(or) <- c("Parent1", "Parent2", "Sibling1", "Sibling2")

# hypothetical marginal probabilities
p <- c(0.2, 0.4, 0.6, 0.8)

# converting odds ratio to correlation
corr <- Odds2Corr(odds = or, marg.probs = p)
print(corr)



