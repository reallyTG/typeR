library(naniar)


### Name: impute_median
### Title: Impute the median value into a vector with missing values
### Aliases: impute_median impute_median.default impute_median.factor

### ** Examples


vec <- rnorm(10)

vec[sample(1:10, 3)] <- NA

impute_median(vec)




