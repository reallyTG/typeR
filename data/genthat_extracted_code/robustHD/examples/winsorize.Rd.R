library(robustHD)


### Name: winsorize
### Title: Data cleaning by winsorization
### Aliases: winsorize winsorize.data.frame winsorize.default
###   winsorize.matrix
### Keywords: robust

### ** Examples

## generate data
set.seed(1234)     # for reproducibility
x <- rnorm(10)     # standard normal
x[1] <- x[1] * 10  # introduce outlier

## winsorize data
x
winsorize(x)



