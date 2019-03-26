library(tab)


### Name: formatp
### Title: Format P-values for Functions in the tab Package
### Aliases: formatp
### Keywords: p p-values

### ** Examples

# Generate vector of numeric p-values
set.seed(123)
p <- c(runif(n = 5, min = 0, max = 1), 1, 0, 4e-7, 0.009)

# Round to nearest 2 decimals for p in (0.01, 1] and 3 decimals for p < 0.01
pvals <- formatp(p = p)

# Use 2 decimal places, a lower bound of 0.01, and omit the leading 0.
pvals <- formatp(p = p, decimals = 2, lowerbound = 0.01, leading0 = FALSE)



