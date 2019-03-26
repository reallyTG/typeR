library(zoocat)


### Name: cattr
### Title: Getting or setting the column attributes table of a 'zoocat'
###   object.
### Aliases: cattr cattr.zoocat cattr<- cattr<-.zoo cattr<-.zoocat

### ** Examples


x <- matrix(1 : 20, nrow = 5)
colAttr <- data.frame(month = c(2, 3, 5, 6), name = 'x')
zc <- zoocat(x, order.by = 1991 : 1995, colattr = colAttr)
cattr(zc)[, 2] <- 'y'

zobj <- zoo(x, order.by = 1991 : 1995)
cattr(zobj) <- colAttr




