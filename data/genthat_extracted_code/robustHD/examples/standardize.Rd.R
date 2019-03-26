library(robustHD)


### Name: standardize
### Title: Data standardization
### Aliases: robStandardize standardize
### Keywords: array

### ** Examples

## generate data
set.seed(1234)     # for reproducibility
x <- rnorm(10)     # standard normal
x[1] <- x[1] * 10  # introduce outlier

## standardize data
x
standardize(x)     # mean and sd
robStandardize(x)  # median and MAD



