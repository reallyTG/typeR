library(zoocat)


### Name: melt_month
### Title: Translate 'zoomly' objects to yearmon format
### Aliases: melt_month

### ** Examples

x <- matrix(1 : 20, nrow = 5)
zm <- zoomly(x, order.by = 1991 : 1995, 
             colattr = data.frame(month = c(2, 3, 5, 6)))
melt_month(zm)

x <- matrix(1 : 20, nrow = 5)
colAttr <- data.frame(month = c(2, 3, 5, 6), name = c(rep('xxx', 3), 'yyy'))
zc <- zoocat(x, order.by = 1991 : 1995, colattr = colAttr)
melt_month(as.zoomly(zc))




