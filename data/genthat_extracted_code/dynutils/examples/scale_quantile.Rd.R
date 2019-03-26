library(dynutils)


### Name: scale_quantile
### Title: Cut off outer quantiles and rescale to a [0, 1] range
### Aliases: scale_quantile

### ** Examples

## Generate a matrix from a normal distribution
## with a large standard deviation, centered at c(5, 5)
x <- matrix(rnorm(200*2, sd = 10, mean = 5), ncol = 2)

## Scale the dataset between [0,1]
x_scaled <- scale_quantile(x)

## Plot rescaled data
plot(x_scaled)

## Show ranges of each column
apply(x_scaled, 2, range)



