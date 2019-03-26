library(matsbyname)


### Name: count_vals_inrows_byname
### Title: Count the number of matrix entries in rows that meet a criterion
### Aliases: count_vals_inrows_byname

### ** Examples

m <- matrix(c(0, 1, 2, 3, 4, 0), nrow = 3, ncol = 2)
count_vals_inrows_byname(m) # uses defaults: compare_fun = "==" and val = 0
count_vals_inrows_byname(m, compare_fun = "!=")
count_vals_inrows_byname(m, compare_fun = `!=`)
# Write expressions in a natural way
count_vals_inrows_byname(m, "<=", 1)
# Also works for lists
count_vals_inrows_byname(list(m,m), "<=", 1)



