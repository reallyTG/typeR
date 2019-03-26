library(zoocat)


### Name: filter_col
### Title: Return columns with matching conditions
### Aliases: filter_col filter_col.zoocat filter_col.zoomly filter_col_q
###   filter_col_q.zoocat filter_col_q.zoomly

### ** Examples

x <- matrix(1 : 20, nrow = 5)
colAttr <- data.frame(month = c(2, 3, 5, 6), name = c(rep('xxx', 3), 'yyy'))
zc <- zoocat(x, order.by = 1991 : 1995, colattr = colAttr)
filter_col(zc, month > 2)
filter_col(zc, month > 2)
filter_col(zc, month > 2 & name == 'yyy')

mat <- matrix(1:48, ncol = 12)
colAttr <- data.frame(month = rep(1 : 12))
zm <- zoomly(mat, order.by = 1991 : 1994, colattr = colAttr)
filter_col(zm, mon.repro = 1 : 3)
filter_col(zm, mon.repro = c(-9 : 8))
filter_col(zm, cond = month %in% 1 : 3, mon.repro = c(-24 : 3))




