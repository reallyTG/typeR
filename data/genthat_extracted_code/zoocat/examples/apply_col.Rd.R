library(zoocat)


### Name: apply_col
### Title: Apply functions over each column
### Aliases: apply_col apply_col.zoocat

### ** Examples

x <- matrix(1 : 20, nrow = 5)
colAttr <- data.frame(month = c(2, 3, 5, 6), name = c(rep('xxx', 3), 'yyy'))
zc <- zoocat(x, order.by = 1991 : 1995, colattr = colAttr)
apply_col(zc, FUN = mean, col.as = 'vector')
apply_col(zc, FUN = max, col.as = 'vector')

 



