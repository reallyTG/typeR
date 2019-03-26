library(zoocat)


### Name: rbind.zoocat
### Title: Merge two or more 'zoocat' objects by rows
### Aliases: rbind.zoocat

### ** Examples

x <- matrix(1 : 20, nrow = 5)
colAttr <- data.frame(month = c(2, 3, 5, 6), name = c(rep('xxx', 3), 'yyy'))
zc <- zoocat(x, order.by = 1991 : 1995, colattr = colAttr) 
zc2 <- zc
index(zc2) <- index(zc) + 6
rbind(zc, zc2)




