library(naniar)


### Name: impute_mean
### Title: Impute the mean value into a vector with missing values
### Aliases: impute_mean impute_mean.default impute_mean.factor

### ** Examples


vec <- rnorm(10)

vec[sample(1:10, 3)] <- NA

impute_mean(vec)




