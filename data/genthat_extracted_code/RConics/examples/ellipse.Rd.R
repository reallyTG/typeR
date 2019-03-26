library(RConics)


### Name: ellipse
### Title: Return ellipse points
### Aliases: ellipse

### ** Examples

# Ellipse parameters
saxes <- c(5,2)
loc <- c(0,0)
theta <- pi/4

# Plot
plot(ellipse(saxes, loc, theta, n=500),type="l")
points(ellipse(saxes, loc, theta, n=30),pch=20,col="red")
points(ellipse(saxes, loc, theta, n=30, method="angle"),pch=20,col="blue")
points(ellipse(saxes, loc, theta, n=30, method="distance"),pch=20,col="green")



