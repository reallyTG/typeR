library(randomForestSRC)


### Name: housing
### Title: Ames Iowa Housing Data
### Aliases: housing
### Keywords: datasets

### ** Examples

## No test: 
## load the data
data(housing, package = "randomForestSRC")

## the original data contains lots of missing data
## here's a fast but reasonably accurate way to impute the data
housing2 <- impute(data = housing, mf.q = 10, fast = TRUE)
## End(No test)


