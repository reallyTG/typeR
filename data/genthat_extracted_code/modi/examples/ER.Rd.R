library(modi)


### Name: ER
### Title: Robust EM-algorithm ER
### Aliases: ER

### ** Examples

data(bushfirem, bushfire.weights)
det.res <- ER(bushfirem, weights = bushfire.weights, alpha = 0.05,
steps.output = TRUE, em.steps = 100, tol = 2e-6)
PlotMD(det.res$dist, ncol(bushfirem))



