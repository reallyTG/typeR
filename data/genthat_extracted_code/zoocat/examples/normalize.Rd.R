library(zoocat)


### Name: normalize
### Title: Normalize data
### Aliases: normalize normalize.default normalize.zoo

### ** Examples


x <- matrix(1 : 20, nrow = 10)
colnames(x) <- c('a', 'b')
rownames(x) <- 1 : 10
normalize(x, method = 'anomaly')
normalize(x, method = 'perc')
normalize(x, method = 'sd1')

z <- zoo(x, order.by = 1991 : 2010)
normalize(z)

x <- matrix(1 : 20, nrow = 5)
colAttr <- data.frame(month = c(2, 3, 5, 6), name = c(rep('xxx', 3), 'yyy'))
zc <- zoocat(x, order.by = 1991 : 1995, colattr = colAttr)
normalize(zc)




