library(starma)


### Name: stcenter
### Title: Space-time centering and scaling function
### Aliases: stcenter
### Keywords: starma stcenter stscale scale

### ** Examples

data <- matrix(rnorm(9400, mean=5, sd=2), 100, 94)
data <- stcenter(data)	# Center and scale the dataset

# Check for mean
sum(data) / (nrow(data) * ncol(data))

# Check for sd
sqrt( sum(data^2) / (nrow(data) * ncol(data) - 1) )



