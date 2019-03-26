library(monotonicity)


### Name: monoBonferroni
### Title: Test of weak monotonicity using Bonferroni bounds
### Aliases: monoBonferroni

### ** Examples

## load non-difference return data and calculate the p-value for H0* of Test 1.
data(demo_returns)
tmp <- monoBonferroni(demo_returns, difference = FALSE)
tmp$TestOnePvalBonferroni



