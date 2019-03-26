library(GenOrd)


### Name: corrcheck
### Title: Checking correlations for feasibility
### Aliases: corrcheck
### Keywords: htest models multivariate distribution

### ** Examples

# four variables
k <- 4
# with 2, 3, 4, and 5 categories (Likert scales, by default)
kj <- c(2,3,4,5)
# and these marginal distributions (set of cumulative probabilities)
marginal <- list(0.4, c(0.6,0.9), c(0.1,0.2,0.4), c(0.6,0.7,0.8,0.9))
corrcheck(marginal) # lower and upper bounds for Pearson's rho
corrcheck(marginal, Spearman=TRUE) # lower and upper bounds for Spearman's rho
# change the supports
support <- list(c(0,1), c(1,2,4), c(1,2,3,4), c(0,1,2,5,10))
corrcheck(marginal, support=support) # updated bounds



