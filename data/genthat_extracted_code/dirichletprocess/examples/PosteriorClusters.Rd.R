library(dirichletprocess)


### Name: PosteriorClusters
### Title: Generate the posterior clusters of a Dirichlet Process
### Aliases: PosteriorClusters

### ** Examples

y <- rnorm(10)
dp <- DirichletProcessGaussian(y)
dp <- Fit(dp, 5)
postClusters <- PosteriorClusters(dp)




