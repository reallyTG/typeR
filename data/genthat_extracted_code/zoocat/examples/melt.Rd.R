library(zoocat)


### Name: melt
### Title: Melt a 'zoocat' Object
### Aliases: melt melt.zoocat

### ** Examples


x <- matrix(1 : 20, nrow = 5)
colAttr <- data.frame(month = c(2, 3, 5, 6), name = c('x', 'y', 'z', 'a'))
zc <- zoocat(x, order.by = 1991 : 1995, colattr = colAttr)
melt(zc)

zm <- as.zoomly(zc)
melt(zm)




