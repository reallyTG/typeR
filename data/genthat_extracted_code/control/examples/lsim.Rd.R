library(control)


### Name: lsim
### Title: Time response of a Linear system
### Aliases: lsim

### ** Examples

signal <- gensig('square',4,10,0.1)
H <- tf(c(2, 5, 1),c(1, 2, 3))
response <- lsim(H, signal$u, signal$t)
plot(signal$t, response$y, type = "l", main = "Linear Simulation Response", col = "blue")
lines(signal$t, signal$u, type = "l", col = "grey")
grid(5,5, col = "lightgray")
## Not run:  based on example at: https://www.mathworks.com/help/ident/ref/lsim.html 

## Not run:  MIMO system response 
A <- rbind(c(0,1), c(-25,-4)); B <- rbind(c(1,1), c(0,1))
C <- rbind(c(1,0), c(0,1)); D <- rbind(c(0,0), c(0,0))
response <- lsim(ss(A,B,C,D), cbind(signal$u, signal$u), signal$t)
plot(signal$t, response$y[1,], type = "l",
 main = "Linear Simulation Response", col = "blue"); grid(7,7)
plot(signal$t, response$y[2,], type = "l",
main = "Linear Simulation Response", col = "blue"); grid(7,7)




