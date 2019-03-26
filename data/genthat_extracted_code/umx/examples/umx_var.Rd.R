library(umx)


### Name: umx_var
### Title: Get variances from a df that might contain some non-numeric
###   columns
### Aliases: umx_var

### ** Examples

tmp     = mtcars[,1:4]
tmp$cyl = ordered(mtcars$cyl) # ordered factor
tmp$hp  = ordered(mtcars$hp)  # binary factor
umx_var(tmp, format = "diag", ordVar = 1, use = "pair")
tmp2 = tmp[, c(1, 3)]
umx_var(tmp2, format = "diag")
umx_var(tmp2, format = "full")



