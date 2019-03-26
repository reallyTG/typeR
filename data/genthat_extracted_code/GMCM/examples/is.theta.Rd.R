library(GMCM)


### Name: is.theta
### Title: Check if parameters are valid
### Aliases: is.theta

### ** Examples

theta1 <- rtheta()  # Create a random correctly formatted theta
is.theta(theta1)

theta2 <- rtheta(d = 3, m = 5)
theta2$m <- 6  # m is now incoherent with the number of components
is.theta(theta2)

theta3 <- rtheta(d = 4, m = 2)
theta3$sigma$comp1[1, 2] <- 0  # Making the covariance matrix non-symmetric
is.theta(theta3)

theta4 <- rtheta(d = 10, m = 10)
theta4$sigma$comp1[1, 1] <- 0  # Destroy positive semi-definiteness
is.theta(theta4)

theta5 <- rtheta()
names(theta5) <- c("m", "d", "prop", "mu", "sigmas") # Incorrect names
is.theta(theta5)



