library(NostalgiR)


### Name: nos.ecdf
### Title: nos.ecdf text-based plot of an empirical CDF.
### Aliases: nos.ecdf

### ** Examples

## Plot the empirical CDF of 10 random standard normal points with 'o' shaped points.
data <- rnorm(10)
nos.ecdf(data)

## Plot the empirical CDF of 100 random stanard normal points with '*' shaped points
data <- rnorm(100)
nos.ecdf(data,pch='*')



