library(inferr)


### Name: infer_chisq_gof_test
### Title: Chi Square Goodness of Fit Test
### Aliases: infer_chisq_gof_test chisq_gof

### ** Examples

infer_chisq_gof_test(hsb, race, c(20, 20, 20, 140))

# apply continuity correction
infer_chisq_gof_test(hsb, race, c(20, 20, 20, 140), correct = TRUE)



