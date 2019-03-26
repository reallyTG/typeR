library(control)


### Name: append
### Title: Append the dynamics of a set of systems
### Aliases: append sysgroup

### ** Examples

sys1 <- ss(1,2,3,4)
sys2 <- ss(2,3,4,5)
sys3 <- ss(6,7,8,9)
append(sys1, sys2, sys3)
sys4 <- tf(1, c(1,2,5))
append(sys1, sys2, sys4)




