library(olsrr)


### Name: ols_coll_diag
### Title: Collinearity diagnostics
### Aliases: ols_coll_diag ols_vif_tol ols_eigen_cindex

### ** Examples

# model
model <- lm(mpg ~ disp + hp + wt + drat, data = mtcars)

# vif and tolerance
ols_vif_tol(model)

# eigenvalues and condition indices
ols_eigen_cindex(model)

# collinearity diagnostics
ols_coll_diag(model)




