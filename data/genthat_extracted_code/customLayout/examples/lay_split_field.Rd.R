library(customLayout)


### Name: lay_split_field
### Title: Split a selected field from layout using a schema from another
###   layout.
### Aliases: lay_split_field laySplitField

### ** Examples


l1 <- lay_new(matrix(c(1:4), ncol = 2), widths = c(4, 1))
l2 <- lay_new(matrix(c(1:4), ncol = 2), widths = c(1, 1))
l3 <- lay_split_field(l1, l2, 2)
lay_show(l3)




