library(spatstat)


### Name: quantile.im
### Title: Sample Quantiles of Pixel Image
### Aliases: quantile.im
### Keywords: spatial methods univar

### ** Examples

# artificial image data
Z <- setcov(square(1))

# find the quartiles
quantile(Z)

# find the deciles
quantile(Z, probs=(0:10)/10)



