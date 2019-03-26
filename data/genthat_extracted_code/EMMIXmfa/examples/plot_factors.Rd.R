library(EMMIXmfa)


### Name: plot_factors
### Title: Plot Function for Factor Scores
### Aliases: plot_factors
### Keywords: cluster multivariate models

### ** Examples

# Visualizing data used in model estimation
set.seed(1)
inds <- dim(iris)[1]
indSample <- sample(1 : inds, 50)
model <- mcfa (iris[indSample, -5], g = 3, q = 2, 
                nkmeans = 1, nrandom = 0, itmax = 150)
minmis(model$clust, iris[indSample, 5])

#same as plot_factors(model, tyep = "Umean", clust = model$clust)
plot(model)

#can provide alternative groupings of samples via plot_factors
plot_factors(model, clust = iris[indSample, 5])

#same as plot_factors(model, tyep = "Uclust")
plot(model, type = "Uclust")

Y <- iris[-c(indSample), -5]
Y <- as.matrix(Y)
clust <- predict(model, Y)
minmis(clust, iris[-c(indSample), 5])

fac_scores <- factor_scores(model, Y)
plot_factors(fac_scores, type = "Umean", clust = clust)
plot_factors(fac_scores, type = "Umean", clust = iris[-c(indSample), 5])



