library(modelr)


### Name: add_predictors
### Title: Add predictors to a formula
### Aliases: add_predictors

### ** Examples

f <- lhs ~ rhs
add_predictors(f, ~var1, ~var2)

# Left-hand sides are ignored:
add_predictors(f, lhs1 ~ var1, lhs2 ~ var2)

# fun can also be set to a function like "*":
add_predictors(f, ~var1, ~var2, fun = "*")



