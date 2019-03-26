library(filling)


### Name: aux.rndmissing
### Title: Randomly assign NAs to the data matrix with probability 'x'
### Aliases: aux.rndmissing

### ** Examples

# load lena64 image matrix
data(lena64)

# generate 10% of missing values
lena64_miss <- aux.rndmissing(lena64)

# visualize
par(mfrow=c(1,2))
image(lena64, axes=FALSE, main="original image")
image(lena64_miss, axes=FALSE, main="10% missing entries")




