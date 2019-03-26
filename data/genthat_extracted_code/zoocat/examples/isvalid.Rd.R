library(zoocat)


### Name: isvalid
### Title: Determine the validity of a 'zoocat' Object
### Aliases: isvalid isvalid.zoocat

### ** Examples


x <- matrix(1 : 20, nrow = 5)
colAttr <- data.frame(month = c(2, 3, 5, 6), name = 'sst')
zc <- zoocat(x, order.by = 1991 : 1995, colattr = colAttr)
isvalid(zc)




