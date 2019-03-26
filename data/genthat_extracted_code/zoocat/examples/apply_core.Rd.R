library(zoocat)


### Name: apply_core
### Title: Apply a function over the core data matrix
### Aliases: apply_core apply_core.zoocat

### ** Examples

x <- matrix(1 : 20, nrow = 5)
colAttr <- data.frame(month = c(2, 3, 5, 6), name = c(rep('xxx', 3), 'yyy'))
zc <- zoocat(x, order.by = 1991 : 1995, colattr = colAttr)

apply_core(zc, FUN = colMeans, bind = 'cattr')
apply_core(zc, FUN = rowMeans, bind = 'index')
apply_core(zc, FUN = function (x) {x*2}, bind = c('index', 'cattr'))
apply_core(zc, FUN = function (x) {t(x*2)}, bind = c('cattr', 'index'))
apply_core(zc, FUN = function (x) {x*2}, bind = c('index', NA))
apply_core(zc, FUN = function (x) {x[3:4, ]}, bind = c(NA, 'cattr'))
apply_core(zc, FUN = function (x) 
                      {r <- x[3:4, ]
                      rownames(r) <- c('a', 'b')
                      return(r)}, 
                      bind = c(NA, 'cattr'))

vec <- as.vector(zc[, 1])
apply_core(zc, FUN = function (x) {cor(x, vec)}, bind = 'cattr')




