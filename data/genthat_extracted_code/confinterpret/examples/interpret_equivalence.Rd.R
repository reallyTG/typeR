library(confinterpret)


### Name: interpret_equivalence
### Title: Equivalence test interpretations of confidence intervals.
### Aliases: interpret_equivalence

### ** Examples

# Establish a test confidence interval
ci_test <- matrix(c(-0.1, 0.1),
                  nrow = 1, dimnames = list("estimate",
                                            c("2.5 %", "97.5 %")))
interpret_equivalence(ci_test, 0, 0.2, c("Treatment as usual", "New treatment"))




