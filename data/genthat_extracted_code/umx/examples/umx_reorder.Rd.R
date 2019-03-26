library(umx)


### Name: umx_reorder
### Title: Reorder or drop variables from a correlation/covariance matrix.
### Aliases: umx_reorder

### ** Examples

oldMatrix = cov(mtcars)
umx_reorder(oldMatrix, newOrder = c("mpg", "cyl", "disp")) # first 3
umx_reorder(oldMatrix, newOrder = c("hp", "disp", "cyl")) # subset and reordered
umx_reorder(oldMatrix, "hp") # edge-case of just 1-var



