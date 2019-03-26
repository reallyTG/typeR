library(starma)


### Name: stcov
### Title: Space-time covariance function
### Aliases: stcov
### Keywords: starma stcov

### ** Examples

data(nb_mat)	# Get neighbourhood matrices

data <- matrix(rnorm(9400), 100, 94)

# Compute covariance between 2-nd and 1-st order neighbours, at time lag 5
stcov(data, blist, 2, 1, 5)		



