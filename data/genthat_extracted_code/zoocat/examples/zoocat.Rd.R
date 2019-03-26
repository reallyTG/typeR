library(zoocat)


### Name: zoocat
### Title: 'zoocat' class
### Aliases: zoocat

### ** Examples


x <- matrix(1 : 20, nrow = 5)
colAttr <- data.frame(month = c(2, 3, 5, 6), name = c(rep('xxx', 3), 'yyy'))
zc <- zoocat(x, order.by = 1991 : 1995, colattr = colAttr)
unclass(zc)
zc[1, 3]
zc[2, ]
zc[, '2_xxx']
coredata(zc)
as.matrix(zc)

x <- matrix(1 : 20, nrow = 5)
colAttr <- data.frame(month = c(2, 3, 5, 6), name = c(rep('xxx', 3), 'yyy'))
zc <- zoocat(x, order.by = 1991 : 1995, colattr = colAttr, frequency = 1)




