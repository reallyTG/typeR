library(sortinghat)


### Name: simdata_friedman
### Title: Generates data from 3 multivariate normal data populations
###   having the covariance structure from Friedman (1989).
### Aliases: simdata_friedman

### ** Examples

# Generates 10 observations from three multivariate normal populations having
# the covariance structure given in Friedman's (1989) fifth experiment.
sample_sizes <- c(10, 20, 30)
p <- 20
data <- simdata_friedman(n = sample_sizes, p = p, experiment = 5, seed = 42)
dim(data$x)
table(data$y)

# Generates 15 observations from each of three multivariate normal
# populations having the covariance structure given in Friedman's (1989)
# sixth experiment.
sample_sizes <- c(15, 15, 15)
p <- 20
set.seed(42)
data2 <- simdata_friedman(n = sample_sizes, p = p, experiment = 6)
dim(data2$x)
table(data2$y)



