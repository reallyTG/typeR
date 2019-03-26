library(codyn)


### Name: confint.cyclic_shift
### Title: Confidence Intervals from a Cyclic Shift Permutation
### Aliases: confint.cyclic_shift

### ** Examples

# Calculate a covariance matrix on a null community
data(knz_001d)
a1_cyclic <- cyclic_shift(subset(knz_001d, subplot == "A_1"),
                   time.var = "year",
                   species.var = "species",
                   abundance.var = "abundance",
                   FUN = cov,
                   bootnumber = 10)

# Return CI on a1_cyclic
confint(a1_cyclic)



