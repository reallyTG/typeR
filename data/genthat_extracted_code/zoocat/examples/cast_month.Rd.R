library(zoocat)


### Name: cast_month
### Title: Cast month of a 'zoomly' object
### Aliases: cast_month

### ** Examples

x <- matrix(1 : 20, nrow = 5)
colAttr <- data.frame(month = c(2, 3, 5, 6), name = c(rep('xxx', 3), 'yyy'))
zc <- zoocat(x, order.by = 1991 : 1995, colattr = colAttr)
zmelt <- melt_month(as.zoomly(zc))
cast_month(zmelt)




