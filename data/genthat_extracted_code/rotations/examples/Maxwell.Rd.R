library(rotations)


### Name: Maxwell
### Title: The modified Maxwell-Boltzmann distribution
### Aliases: Maxwell dmaxwell pmaxwell rmaxwell

### ** Examples

r <- seq(-pi, pi, length = 500)

#Visualize the Maxwell-Boltzmann density fucntion with respect to the Haar measure
plot(r, dmaxwell(r, kappa = 10), type = "l", ylab = "f(r)")

#Visualize the Maxwell-Boltzmann density fucntion with respect to the Lebesgue measure
plot(r, dmaxwell(r, kappa = 10, Haar = FALSE), type = "l", ylab = "f(r)")

#Plot the Maxwell-Boltzmann CDF
plot(r,pmaxwell(r,kappa = 10), type = "l", ylab = "F(r)")

#Generate random observations from Maxwell-Boltzmann distribution
rs <- rmaxwell(20, kappa = 1)
hist(rs, breaks = 10)



