library(rgr)


### Name: rng
### Title: Undertakes a Range Transformation on the Columns of a Matrix
### Aliases: rng
### Keywords: manip

### ** Examples

## Make test data available
data(sind)
sind.mat <- as.matrix(sind[, -c(1:3)])

## Undertake range transform
temp <- rng(sind.mat)
temp

## Clean-up
rm(sind.mat)
rm(temp)



