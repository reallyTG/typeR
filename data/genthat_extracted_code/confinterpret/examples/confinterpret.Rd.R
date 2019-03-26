library(confinterpret)


### Name: confinterpret
### Title: Descriptive interpretations of confidence intervals.
### Aliases: confinterpret

### ** Examples

# Establish a test confidence interval
ci_test <- matrix(c(-0.1,0.1),
                  nrow = 1, dimnames = list("estimate",
                                            c("2.5 %","97.5 %")))
confinterpret(ci_test, interpretations_superiority, 0,
  comparison_labels = c(comparison_intervention = "Treatment as usual",
                        tested_intervention = "New treatment"))




