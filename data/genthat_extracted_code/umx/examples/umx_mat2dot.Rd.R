library(umx)


### Name: umx_mat2dot
### Title: Return dot code for paths in a matrix
### Aliases: umx_mat2dot

### ** Examples

# Make a lower 3*3 value= 1:6 (1,4,6 on the diag)
a_cp = umxMatrix("a_cp", "Lower", 3, 3, free = TRUE, values = 1:6)
out = umx_mat2dot(a_cp, cells = "lower", from = "rows", arrows = "both")
cat(out$str)
out = umx_mat2dot(a_cp, cells = "lower", from = "cols", arrows = "both")
cat(out$str)
# First call also inits the plot struct
out = umx_mat2dot(a_cp, from = "rows", cells = "lower", arrows = "both", type = "latent")
out = umx_mat2dot(a_cp, from = "rows", cells = "diag" , toLabel= "common", type = "latent", p = out)
cat(out$str)




