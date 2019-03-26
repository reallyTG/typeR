library(confinterpret)


### Name: interpret_superiority
### Title: Superiority test interpretations of confidence intervals.
### Aliases: interpret_superiority

### ** Examples

# Establish a test confidence interval
ci_test <- matrix(c(-0.1, 0.1),
                  nrow = 1, dimnames = list("estimate",
                                            c("2.5 %", "97.5 %")))
interpret_superiority(ci_test, 0, c("Treatment as usual", "New treatment"))




