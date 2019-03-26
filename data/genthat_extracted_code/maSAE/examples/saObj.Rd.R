library(maSAE)


### Name: saObj
### Title: An ui-constructor for classes sadObj and saeObj
### Aliases: saObj

### ** Examples


library('maSAE')
## load data
data('s2')
## create sadObj object
saeO  <- saObj(data = s2, f = y ~ NULL | g)
## create saeObj object
s2$s2 <- TRUE
saeO <- saObj(data = s2, f = y ~x1 + x2 + x3 | g, s2 = 's2')




