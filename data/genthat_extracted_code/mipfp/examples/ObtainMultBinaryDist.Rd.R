library(mipfp)


### Name: ObtainMultBinaryDist
### Title: Generating a multivariate Bernoulli joint-distribution
### Aliases: ObtainMultBinaryDist
### Keywords: distribution multivariate

### ** Examples

# initial odds ratios from Qaqish et al. (2012)
or <- matrix(c(Inf, 0.281, 2.214, 2.214, 
               0.281, Inf, 2.214, 2.214,
               2.214, 2.214, Inf, 2.185,
               2.214, 2.214, 2.185, Inf), nrow = 4, ncol = 4, byrow = TRUE)
rownames(or) <- colnames(or) <- c("Parent1", "Parent2", "Sibling1", "Sibling2")

# hypothetical marginal probabilities
p <- c(0.2, 0.4, 0.6, 0.8)

# estimating the joint-distribution
p.joint <- ObtainMultBinaryDist(odds = or, corr = NULL, marg.probs = p)
print(p.joint$joint.proba)

# obtain identical solution when providing correlation
corr <- Odds2Corr(odds = or, marg.probs = p)$corr
p.joint.alt <- ObtainMultBinaryDist(corr = corr, marg.probs = p)

# checking if the results are truly identicals
diff <- sum(abs(p.joint.alt$joint.proba - p.joint$joint.proba))
cat('Sum of the absolute deviations: ', diff, '\n')



