library(KSD)


### Name: plotgmm
### Title: Plots histogram for 1-d GMM given the dataset
### Aliases: plotgmm

### ** Examples

# Plot pdf histogram for a given dataset
model <- gmm()
X <- rgmm(model)
plotgmm(data=X)

# Plot pdf histogram for a given dataset, with lines that indicate the mean
model <- gmm()
mu <- model$mu
X <- rgmm(model)
plotgmm(data=X, mu=mu)



