library(EMMIXmfa)


### Name: factor_scores
### Title: Computes Factor Scores
### Aliases: factor_scores factor_scores.mcfa factor_scores.mctfa
###   plot.emmix
### Keywords: cluster multivariate models

### ** Examples

# Fit a MCFA model to a subset
set.seed(1)
samp_size <- dim(iris)[1]
sel_subset <- sample(1 : samp_size, 50)
model <- mcfa(iris[sel_subset, -5], g = 3, q = 2, 
                          nkmeans = 1, nrandom = 0, itmax = 100)

# plot the data points in the factor space
plot(model)

# Allocating new samples to the clusters
Y <- iris[-c(sel_subset), -5]
Y <- as.matrix(Y)
clust <- predict(model, Y)

fa_scores <- factor_scores(model, Y)
# Visualizing new data in factor space
plot_factors(fa_scores, type = "Umean", clust = clust)



