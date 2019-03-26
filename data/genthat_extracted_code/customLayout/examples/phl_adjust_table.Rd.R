library(customLayout)


### Name: phl_adjust_table
### Title: Create flextable for layout's placeholder.
### Aliases: phl_adjust_table

### ** Examples


lay <- lay_new(matrix(1:4,nc=2),widths=c(3,2),heights=c(2,1))
lay2 <- lay_new(matrix(1:3))
lay3 <- lay_bind_col(lay,lay2, widths=c(3,1))
offLayout <- phl_layout(lay3)

x <- tail(iris, 10)[,c(1,5)]

phl_adjust_table(x, offLayout, 1)
phl_adjust_table(x, offLayout, 2)




