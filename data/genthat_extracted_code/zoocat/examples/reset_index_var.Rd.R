library(zoocat)


### Name: reset_index_var
### Title: Reset index variable of a 'zoocat' object
### Aliases: reset_index_var reset_index_var.zoocat

### ** Examples


x <- matrix(1 : 20, nrow = 5)
colAttr <- data.frame(month = c(2, 3, 5, 6), name = c(rep('xxx', 3), 'yyy'))
zc <- zoocat(x, order.by = 1991 : 1995, colattr = colAttr)
print(zc)
reset_index_var(zc, 'month')
reset_index_var(zc, 'name')




