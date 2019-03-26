library(control)


### Name: parallel
### Title: Parallel Connection of two systems
### Aliases: parallel

### ** Examples

sys2 = ss(1,2,3,4)
sys3 = ss(6,7,8,9)
parallel(sys2, sys3)
parallel(tf(1, c(1,2,3)), ss(1,2,3,4))
parallel(tf(1, c(1,2,3)),tf(2, c(3,2,3)))



