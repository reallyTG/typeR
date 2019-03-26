library(eulerr)


### Name: euler
### Title: Area-proportional Euler diagrams
### Aliases: euler euler.default euler.data.frame euler.matrix euler.table
###   euler.list

### ** Examples

# Fit a diagram with circles
combo <- c(A = 2, B = 2, C = 2, "A&B" = 1, "A&C" = 1, "B&C" = 1)
fit1 <- euler(combo)

# Investigate the fit
fit1

# Refit using ellipses instead
fit2 <- euler(combo, shape = "ellipse")

# Investigate the fit again (which is now exact)
fit2

# Plot it
plot(fit2)

# A set with no perfect solution
euler(c("a" = 3491, "b" = 3409, "c" = 3503,
        "a&b" = 120, "a&c" = 114, "b&c" = 132,
        "a&b&c" = 50))

# Using grouping via the 'by' argument through the data.frame method
euler(fruits, by = list(sex, age))


# Using the matrix method
euler(organisms)

# Using weights
euler(organisms, weights = c(10, 20, 5, 4, 8, 9, 2))

# The table method
euler(pain, factor_names = FALSE)

# A euler diagram from a list of sample spaces (the list method)
euler(plants[c("erigenia", "solanum", "cynodon")])



