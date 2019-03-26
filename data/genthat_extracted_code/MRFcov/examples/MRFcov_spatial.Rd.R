library(MRFcov)


### Name: MRFcov_spatial
### Title: Spatially structured Markov Random Fields with covariates
### Aliases: MRFcov_spatial

### ** Examples

## No test: 
data("Bird.parasites")
Latitude <- sample(seq(120, 140, length.out = 100), nrow(Bird.parasites), TRUE)
Longitude <- sample(seq(-19, -22, length.out = 100), nrow(Bird.parasites), TRUE)
coords <- data.frame(Latitude = Latitude, Longitude = Longitude)
CRFmod_spatial <- MRFcov_spatial(data = Bird.parasites, n_nodes = 4,
                                family = 'binomial', coords = coords)
## End(No test)




