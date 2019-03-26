library(RConics)


### Name: cubic
### Title: Roots of the cubic equation.
### Aliases: cubic

### ** Examples

# cubic equation x^3 - 6x^2 + 11x - 6 = 0
# parameter
b <- c(1,-6, 11, -6)

# roots
x0 <- cubic(b)

# plot
x <- seq(0,4, by=0.001)
y <- b[1]*x^3 + b[2]*x^2 + b[3]*x + b[4]

# plot
plot(x,y,type="l")
abline(h=0,v=0)
points(cbind(x0,c(0,0,0)), pch=20,col="red",cex=1.8)



