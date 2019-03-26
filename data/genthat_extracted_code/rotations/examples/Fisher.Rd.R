library(rotations)


### Name: Fisher
### Title: The matrix-Fisher distribution
### Aliases: dfisher Fisher pfisher rfisher

### ** Examples

r <- seq(-pi, pi, length = 500)

#Visualize the matrix Fisher density fucntion with respect to the Haar measure
plot(r, dfisher(r, kappa = 10), type = "l", ylab = "f(r)")

#Visualize the matrix Fisher density fucntion with respect to the Lebesgue measure
plot(r, dfisher(r, kappa = 10, Haar = FALSE), type = "l", ylab = "f(r)")

#Plot the matrix Fisher CDF
plot(r,pfisher(r,kappa = 10), type = "l", ylab = "F(r)")

#Generate random observations from matrix Fisher distribution
rs <- rfisher(20, kappa = 1)
hist(rs, breaks = 10)



