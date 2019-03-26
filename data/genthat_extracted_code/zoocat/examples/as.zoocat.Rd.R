library(zoocat)


### Name: as.zoocat
### Title: Coercing objects to Class 'zoocat'
### Aliases: as.zoocat as.zoocat.zoo as.zoocat.zoomly

### ** Examples


x <- matrix(1 : 20, nrow = 5)
zm <- zoomly(x, order.by = 1991 : 1995, colattr = data.frame(month = c(2, 3, 5, 6)))
as.zoocat(zm)

zobj <- zoo(matrix(1:10, nrow = 5), order.by = 11:15)
colnames(zobj) <- c('a', 'b')
as.zoocat(zobj)




