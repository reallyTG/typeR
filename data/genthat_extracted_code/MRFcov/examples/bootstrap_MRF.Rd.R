library(MRFcov)


### Name: bootstrap_MRF
### Title: Bootstrap observations to estimate MRF parameter coefficients
### Aliases: bootstrap_MRF

### ** Examples

## No test: 
data("Bird.parasites")

# Perform 100 bootstrap replicates in total
bootedCRF <- bootstrap_MRF(data = Bird.parasites,
                          n_nodes = 4,
                          family = 'binomial',
                          n_cores = 3)


# Using spatial coordinates for a spatial CRF
Latitude <- sample(seq(120, 140, length.out = 100), nrow(Bird.parasites), TRUE)
Longitude <- sample(seq(-19, -22, length.out = 100), nrow(Bird.parasites), TRUE)
coords <- data.frame(Latitude = Latitude, Longitude = Longitude)
bootedSpatial <- bootstrap_MRF(data = Bird.parasites, n_nodes = 4,
                             family = 'binomial',
                             spatial = TRUE,
                             coords = coords,
                             n_cores = 3)
## End(No test)



