library(tidyboot)


### Name: tidyboot.numeric
### Title: Non-parametric bootstrap for numeric vector data
### Aliases: tidyboot.numeric

### ** Examples

## Mean and 95% confidence interval for 500 samples from a normal distribution
x <- rnorm(500, mean = 0, sd = 1)
tidyboot(x, statistics_functions = list("ci_lower" = ci_lower,
                                        "mean" = mean,
                                        "ci_upper" = ci_upper))



