library(hypervolume)


### Name: padded_range
### Title: Generates axis-wise range limits with padding
### Aliases: padded_range

### ** Examples

data(iris)
iris_rangebox_nopadding = padded_range(iris[,1:3])
iris_rangebox_padding = padded_range(iris[,1:3], multiply.interval.amount=0.5, add.amount=0.1)



