library(subcopem2D)


### Name: dependence
### Title: Dependence Measures
### Aliases: dependence

### ** Examples

V <- runif(300)  # Continuous Uniform(0,1)
W <- V*(1-V)     # Continuous transform of V
# X given V=v as continuous Uniform(0,v)
X <- mapply(runif, rep(1, length(V)), rep(0, length(V)), V)
Y <- 1*(0.2 < X)*(X < 0.6)  # Discrete transform of X
Z <- X*(0.1 < X)*(X < 0.9) + 1*(X >= 0.9)  # Mixed transform of X
V[1:10] <- NA  # Introducing some NAs
W[3:12] <- NA  # Introducing some NAs
Y[5:25] <- NA  # Introducing some NAs
vector5D <- cbind(V, W, X, Y, Z)  # Matrix of 5-variate observations
# Monotone and supremum dependence, ratio and proportion of NAs:
(deparray <- dependence(vector5D, cont = c(1, 2, 3), 30))
# Pearson's correlations:
cor(vector5D, method = "pearson", use = "pairwise.complete.obs")
# Spearman's correlations:
cor(vector5D, method = "spearman", use = "pairwise.complete.obs") 
# Kendall's correlations:
cor(vector5D, method = "kendall", use = "pairwise.complete.obs")   
pairs(vector5D)  # Matrix of pairwise scatterplots



