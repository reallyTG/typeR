library(control)


### Name: series
### Title: Series Connection of two systems
### Aliases: series

### ** Examples

series(tf(1, c(1,2,3)), tf(2, c(2,3,5)))
sys2 = ss(1,2,3,4)
sys3 = ss(6,7,8,9)
series(sys2, sys3)
series(tf(1, c(1,2,3)), ss(1,2,3,4))




