library(EDMeasure)


### Name: mdm
### Title: Mutual Dependence Measures
### Aliases: mdm

### ** Examples

# X is a 10 x 3 matrix with 10 samples and 3 variables
X <- matrix(rnorm(10 * 3), 10, 3)

# assume X = (X1, X2) where X1 is 1-dim, X2 is 2-dim
mdm(X, dim_comp = c(1, 2), type = "asym_dcov")

# assume X = (X1, X2) where X1 is 2-dim, X2 is 1-dim
mdm(X, dim_comp = c(2, 1), type = "sym_dcov")

# assume X = (X1, X2, X3) where X1 is 1-dim, X2 is 1-dim, X3 is 1-dim
mdm(X, dim_comp = c(1, 1, 1), type = "comp_simp")



