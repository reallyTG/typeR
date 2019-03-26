library(customLayout)


### Name: lay_bind_row
### Title: Take two Layout objects and combine by rows.
### Aliases: lay_bind_row layRowBind

### ** Examples

l1 = lay_new(matrix(c(1:2),ncol = 2),widths=c(4,1))
l2 = lay_new(matrix(c(1:4),ncol = 2),widths=c(1,1))
lb = lay_bind_row(l1,l2)
lay_show(lb)




