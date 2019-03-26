library(zoocat)


### Name: order_col
### Title: Order a 'zoocat' object by column
### Aliases: order_col

### ** Examples

x <- matrix(1 : 20, nrow = 5)
colAttr <- data.frame(month = c(2, 3, 5, 6), name = c(rep('xxx', 3), 'yyy'))
zm <- zoomly(x, order.by = 1991 : 1995, colattr = colAttr)
order_col(zm)
zm <- zm[, c(4, 2, 3, 1)]
order_col(zm)




