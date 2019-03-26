library(SciViews)


### Name: nr
### Title: Convenience functions for rows or columns manipulations.
### Aliases: nr nc ROWS COLS
### Keywords: datasets

### ** Examples

mm <- matrix(1:6, nrow = 3)
nr(mm)
nc(mm)
vv <- 1:6
nr(vv)
nc(vv)
# ROWS and COLS constants used with apply()
apply(mm, ROWS, mean) # Idem apply(mm, 1, mean)
apply(mm, COLS, mean) # Idem apply(mm, 2, mean)



