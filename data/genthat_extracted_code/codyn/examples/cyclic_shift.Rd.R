library(codyn)


### Name: cyclic_shift
### Title: Cyclic Shift Permutations
### Aliases: cyclic_shift temporal_torus_translation

### ** Examples

# Calculate a covariance matrix on a null community
data(knz_001d)
a1_cyclic <- cyclic_shift(subset(knz_001d, subplot == "A_1"),
                   time.var = "year",
                   species.var = "species",
                   abundance.var = "abundance",
                   FUN = cov,
                   bootnumber = 10)



