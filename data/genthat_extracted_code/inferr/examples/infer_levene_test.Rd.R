library(inferr)


### Name: infer_levene_test
### Title: Levene's test for equality of variances
### Aliases: infer_levene_test infer_levene_test.default levene_test

### ** Examples

# using grouping variable
infer_levene_test(hsb, read, group_var = race)

# using  variables
infer_levene_test(hsb, read, write, socst)




