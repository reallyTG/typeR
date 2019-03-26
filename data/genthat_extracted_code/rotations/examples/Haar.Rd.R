library(rotations)


### Name: Haar
### Title: Uniform distribution
### Aliases: dhaar Haar phaar rhaar

### ** Examples

r <- seq(-pi, pi, length = 1000)

#Visualize the uniform distribution with respect to Lebesgue measure
plot(r, dhaar(r), type = "l", ylab = "f(r)")

#Visualize the uniform distribution with respect to Haar measure, which is
#a horizontal line at 1
plot(r, 2*pi*dhaar(r)/(1-cos(r)), type = "l", ylab = "f(r)")

#Plot the uniform CDF
plot(r,phaar(r), type = "l", ylab = "F(r)")

#Generate random observations from uniform distribution
rs <- rhaar(50)

#Visualize on the real line
hist(rs, breaks = 10)



