library(rotations)


### Name: Mises
### Title: The circular-von Mises distribution
### Aliases: dvmises Mises pvmises rvmises

### ** Examples

r <- seq(-pi, pi, length = 500)

#Visualize the von Mises density fucntion with respect to the Haar measure
plot(r, dvmises(r, kappa = 10), type = "l", ylab = "f(r)", ylim = c(0, 100))

#Visualize the von Mises density fucntion with respect to the Lebesgue measure
plot(r, dvmises(r, kappa = 10, Haar = FALSE), type = "l", ylab = "f(r)")

#Plot the von Mises CDF
plot(r,pvmises(r,kappa = 10), type = "l", ylab = "F(r)")

#Generate random observations from von Mises distribution
rs <- rvmises(20, kappa = 1)
hist(rs, breaks = 10)



