library(customLayout)


### Name: print.OfficerCustomLayout
### Title: Print a OfficerCustomLayout object.
### Aliases: print.OfficerCustomLayout

### ** Examples


lay  <- lay_new(matrix(1:4,nc = 2),widths = c(3, 2),heights = c(2, 1))
lay2 <- lay_new(matrix(1:3))
cl <- lay_bind_col(lay,lay2, widths=c(3,1))
ofl <- phl_layout(cl, innerMargins = rep(0.1,4))
print(ofl)




