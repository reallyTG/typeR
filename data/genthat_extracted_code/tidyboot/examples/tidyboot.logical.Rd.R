library(tidyboot)


### Name: tidyboot.logical
### Title: Non-parametric bootstrap for logical vector data
### Aliases: tidyboot.logical

### ** Examples

## Mean and 95% confidence interval for 500 samples from a binomial distribution
x <- as.logical(rbinom(500, 1, 0.5))
tidyboot(x, statistics_functions = c(ci_lower, mean, ci_upper))



