library(zoocat)


### Name: cor
### Title: Correlation computing for 'zoo' or 'zoocat' objects
### Aliases: cor cor.zoo cor.zoocat

### ** Examples


x <- zoo(c(1, 3, 2, 4, 5))
y <- zoo(c(12, 30, 2, 46, 5))
cor(x, y)

x <- matrix(1 : 20, nrow = 5)
colAttr <- data.frame(month = c(2, 3, 5, 6), name = 'x')
zc <- zoocat(x, order.by = 1991 : 1995, colattr = colAttr)
y <- zoo(c(3, 5, 4, 6, 3), order.by = 1991 : 1995)
cor(zc, y, method = 'kendall')
cor(zc, method = 'kendall')





