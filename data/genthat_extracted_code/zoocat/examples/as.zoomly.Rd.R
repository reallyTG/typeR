library(zoocat)


### Name: as.zoomly
### Title: Coercion objects to class 'zoomly'
### Aliases: as.zoomly as.zoomly.zoocat

### ** Examples

x <-  matrix(1 : 36, nrow = 3)
zc <- zoocat(x, order.by = 1991 : 1993, 
             colattr = data.frame(month = 1 : 12))
as.zoomly(zc)
             

x <- matrix(1 : 20, nrow = 5)
colAttr <- data.frame(month = c(2, 3, 5, 6), name = c(rep('xx', 3), 'yy'))
zc <- zoocat(x, order.by = 1991 : 1995, colattr = colAttr)
as.zoomly(zc)




