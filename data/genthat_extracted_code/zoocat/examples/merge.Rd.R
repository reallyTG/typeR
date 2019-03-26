library(zoocat)


### Name: merge
### Title: Combine 'zoocat' or 'zoomly' Objects by Columns
### Aliases: cbind.zoocat merge merge.zoocat

### ** Examples


x1 <- matrix(1 : 20, nrow = 5)
colAttr <- data.frame(month = c(2, 3, 5, 6), name = 'xxx')
zc1 <- zoocat(x1, order.by = 1991 : 1995, colattr = colAttr)
x2 <- x1 + 100
colAttr2 <- data.frame(modified = TRUE, month = c(4, 6, 7, 9))
zc2 <- zoocat(x2, order.by = 1991 : 1995, colattr = colAttr2)
merge(zc1, zc2)
merge(zc1, lag(zc2), fill = -999)
merge(zc1, lag(zc2), all = FALSE)
cbind(zc1, zc2)




