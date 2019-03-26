library(zoocat)


### Name: indname
### Title: Get or set the name of the index variable
### Aliases: indname indname.zoocat indname<- indname<-.zoocat

### ** Examples

x <- matrix(1 : 20, nrow = 5)
colAttr <- data.frame(month = c(2, 3, 5, 6), name = c(rep('xxx', 3), 'yyy'))
zc <- zoocat(x, order.by = 1991 : 1995, colattr = colAttr)
indname(zc)
indname(zc) <- 'time'




