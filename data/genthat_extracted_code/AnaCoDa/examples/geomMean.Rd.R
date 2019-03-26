library(AnaCoDa)


### Name: geomMean
### Title: Take the geometric mean of a vector
### Aliases: geomMean

### ** Examples

x <- c(1, 2, 3, 4)
geomMean(x)

y<- c(1, NA, 3, 4, 0, -1)
# Only take the mean of non-Na values greater than 0
geomMean(y)

# Replace values <= 0 or NAs with a default value 0.001 and then take the mean
geomMean(y, rm.invalid = FALSE, default = 0.001)




