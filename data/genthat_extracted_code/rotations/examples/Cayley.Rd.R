library(rotations)


### Name: Cayley
### Title: The symmetric Cayley distribution
### Aliases: Cayley dcayley pcayley rcayley

### ** Examples

r <- seq(-pi, pi, length = 500)

#Visualize the Cayley density fucntion with respect to the Haar measure
plot(r, dcayley(r, kappa = 10), type = "l", ylab = "f(r)")

#Visualize the Cayley density fucntion with respect to the Lebesgue measure
plot(r, dcayley(r, kappa = 10, Haar = FALSE), type = "l", ylab = "f(r)")

#Plot the Cayley CDF
plot(r,pcayley(r,kappa = 10), type = "l", ylab = "F(r)")

#Generate random observations from Cayley distribution
rs <- rcayley(20, kappa = 1)
hist(rs, breaks = 10)



