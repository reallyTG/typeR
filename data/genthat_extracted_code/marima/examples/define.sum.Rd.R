library(marima)


### Name: define.sum
### Title: define.sum
### Aliases: define.sum

### ** Examples

set.seed(4711)
y <- round(matrix(100*rnorm(48), nrow=4))
difference=matrix(c(1, 1,  1, 1,  2, 1,  3, 6), nrow=2)
dy <- define.dif(y, difference)$dif.series
averages <- define.dif(y, difference)$averages
sum.y <- define.sum(dy, difference, averages)$series.sum
y
dy
averages
sum.y




