library(zoocat)


### Name: as.zoo
### Title: Coercion objects to class 'zoo'
### Aliases: as.zoo as.zoo.zoocat

### ** Examples


x <- matrix(1 : 20, nrow = 5)
zc <- zoocat(x, order.by = 1991 : 1995, colattr = data.frame(month=c(2, 3, 5, 6)))
z <- as.zoo(zc)




