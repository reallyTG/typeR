library(JWileymisc)


### Name: meanDeviations
### Title: Function to calculate the mean and deviations from mean
### Aliases: meanDeviations

### ** Examples

## simple example showing what it does
meanDeviations(1:10)

## example use case, applied to a data.table
d <- as.data.table(iris)
d[, c("BSepal.Length", "WSepal.Length") := meanDeviations(Sepal.Length),
  by = Species]
str(d)



