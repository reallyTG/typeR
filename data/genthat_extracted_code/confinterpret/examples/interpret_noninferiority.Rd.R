library(confinterpret)


### Name: interpret_noninferiority
### Title: Non-inferiority test interpretations of confidence intervals.
### Aliases: interpret_noninferiority

### ** Examples

# Establish a test confidence interval
ci_test <- matrix(c(-0.05, 0.05),
                  nrow = 1, dimnames = list("estimate",
                                            c("2.5 %", "97.5 %")))
interpret_noninferiority(ci_test, 0, 0.1, c("Treatment as usual",
                                            "New treatment"))




