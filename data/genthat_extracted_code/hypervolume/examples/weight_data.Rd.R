library(hypervolume)


### Name: weight_data
### Title: Abundance weighting and prior of data for hypervolume input
### Aliases: weight_data

### ** Examples

data(iris)
weighted_data <- weight_data(iris[,1:3],weights=1+rpois(n=nrow(iris),lambda=3))
pairs(weighted_data)

weighted_noisy_data <- weight_data(iris[,1:3],weights=1+rpois(n=nrow(iris),lambda=3),jitter.sd=0.5)
pairs(weighted_noisy_data)



