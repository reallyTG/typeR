library(control)


### Name: selectsys
### Title: Select/Remove Subsystem in State-space Model
### Aliases: selectsys removesys

### ** Examples

A <- rbind(c(33,2,5), c(23,200,2), c(9,2,45))
B <- rbind(c(4,5), c(12,5), c(82,1))
C <- rbind(c(34,56,2), c(6,2,112))
D <- rbind(c(2,0), c(0,19))
sys1 <- ss(A, B, C, D)
 selectsys(sys1, 1, 1) # extract subsystem for only input 1 and output 1
 selectsys(sys1, 2,2) # extract subsystem for only input 2 and output 2
 selectsys(sys1, 2, 1:2) # extract subsystem for only input 1 and output 1 to 2
 selectsys(sys1, 1:2, 2) # extract subsystem for only input 1 to 2 and output 2 to 2
 selectsys(sys1, 2, 2, 1:2) # extract subsystem for only input 2 and output 2 but states 1 to 2
 removesys(sys1, 1,2) # removes input 1 and output 2



